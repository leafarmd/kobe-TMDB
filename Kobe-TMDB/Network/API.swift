//
//  API.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 23/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

final class API {
    
    private static let baseUrl = "https://api.themoviedb.org/3/"
    private static let apiKey = "1f54bd990f1cdfb230adb312546d765d"
    
    static func request<T: Decodable>(from endpoint: APIEndpoint,
                                      type: T.Type,
                                      method: HttpMethod = .GET,
                                      completion: @escaping CompletionCallback<T>) {
        request(from: endpoint.url,
                params: endpoint.params,
                type: type,
                method: method,
                completion: completion)
        
    }
    
    private static func request<T: Decodable>(from endpoint: String,
                                              params: [String: String],
                                              type: T.Type,
                                              method: HttpMethod,
                                              completion: @escaping CompletionCallback<T>) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let pathURL = "\(baseUrl)\(endpoint)"
        
        var baseURL = URLComponents(string: pathURL)
        baseURL?.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        
        params.forEach { baseURL?.queryItems?.append(URLQueryItem(name: $0.key, value: $0.value)) }
        
        guard let url = baseURL?.url else {
            completion(.failure(.malformedURL))
            return
        }
        
        var request : URLRequest = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    completion(.failure(.requestFailed))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let dataType = try decoder.decode(type.self, from: data)
                    completion(.success(dataType))
                } catch {
                    do {
                        let errorType = try decoder.decode(APIError.self, from: data)
                        completion(.other(errorType))
                    } catch {
                        completion(.failure(.decodingFailed))
                    }
                }
            }
        }.resume()
    }
}

