//
//  AsyncTableViewcontroller.swift
//  BaseProject
//
//  Created by 강한결 on 7/19/24.
//

import UIKit
import SnapKit


final class AsyncTableViewcontroller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var page = 1
    private var movieData: [MovieModel] = []
    private var isFetching: Bool = false
    
    private let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(table)
        table.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMovieDatas()
    }
    
    private func getMovieDatas() {
        Task {
            do {
                isFetching = true
                try await Task.sleep(nanoseconds: 1_000_000_000) // 1초 정도 휴지기 줌
                let datas = try await MovieService.shared.getMovies(by: page)
                
                movieData.append(contentsOf: datas)
                table.reloadData()
                isFetching = false
            } catch {
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(movieData[indexPath.row].title) | \(movieData[indexPath.row].release_date)"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        /// idea.
        /// ContentView height > Bounds height 일 경우에 스크롤이 발생한다면,
        /// contentOffset.y > ContentView.height - Bounds.height 인 경우가 스크롤이 화면의 제일 하단에 도달했을 때가 아닐까?
        
        if table.contentOffset.y > (table.contentSize.height - table.bounds.size.height) {
            if !isFetching {
                print("🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇")
                page += 1
                print("🥇🥇🥇🥇🥇🥇🥇🥇\(page)🥇🥇🥇🥇🥇🥇🥇🥇🥇")
                getMovieDatas()
            }
        }
    }
}
