//
//  MovieModel.swift
//  BaseProject
//
//  Created by 강한결 on 7/19/24.
//

import Foundation

struct MovieModel: Codable {
    let title: String
    let release_date: String
}

struct MovieResult: Codable {
    let results: [MovieModel]
}


final class MovieService {
    private init() {}
    
    static let shared = MovieService()
    
    enum ServiceErros: String, Error {
        case urlError = "정확한 요청 URL를 확인해주세요."
        case responseError = "응답을 확인할 수 없습니다."
        case notFound = "요청한 데이터를 확인할 수 없습니다."
    }
    
    func getMovies(by page: Int) async throws -> [MovieModel]  {
        
        var urlComponent = URLComponents(string: URL_MOVIE_TREND)
        var queryPage = URLQueryItem(name: "page", value: String(page))
        var queryLang = URLQueryItem(name: "lang", value: "ko-KR")
        
        urlComponent?.queryItems = [queryPage, queryLang]
        
        guard let requestURL = urlComponent?.url else {
            throw ServiceErros.urlError
        }
        
        var request = URLRequest(url: requestURL)
        request.allHTTPHeaderFields = ["Authorization": TMDB_AUTHORIZATION, "accept" : "application/json"]
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        guard let decodeData = try? JSONDecoder().decode(MovieResult.self, from: data) else {
            throw ServiceErros.notFound
        }
        
        return decodeData.results
    }
}
