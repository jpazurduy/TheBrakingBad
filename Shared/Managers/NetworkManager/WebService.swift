//
//  NetworkService.swift
//  TheBreakingBad
//
//  Created by AvanticaMAC2 on 1/28/21.
//

import Foundation

enum HttpMethod: String {
    case get = "get"
    case post = "post"
    case put = "put"
}

enum WebError: Error {
    case requestFailed(Error)
    case serverError(statusCode: Int)
    case badURL
    case unknown(Error)
    case noData
}

enum Result<T, Error> {
    case success(T)
    case failure(Error  )
}

typealias ResultCompletion<T, Error> = (Result<T ,Error>) -> Void

class WebService {

    static let sessionConfiguration = URLSessionConfiguration.default
        
    static var session: URLSession?
    static var dataTask: URLSessionDataTask?
    
    
    static func setConfiguration() {
        //sessionConfiguration.httpAdditionalHeaders = ["api_key":token]
        sessionConfiguration.timeoutIntervalForRequest = 60.0
        
        session = URLSession(configuration: sessionConfiguration)
    }
    
    
    static func sendRequest<T: Decodable>(pathURL: String,
                                          parameters: [String:Any]? = nil,
                                          method: HttpMethod,
                                          completion: @escaping (Result<[T], Error>) -> Void) {
        
        dataTask?.cancel()

        guard let url = URL(string: pathURL) else {
            completion(.failure(WebError.badURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        dataTask = session?.dataTask(with: request) { (data, response, error) in

            DispatchQueue.main.async {
                // 1
                if let error = error {
                    completion(.failure(WebError.requestFailed(error)))
                    return
                }
                
                // 2
                if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    completion(.failure(WebError.serverError(statusCode: response.statusCode)))
                    return
                }
                            
                // 3
                guard let data = data else {
                    completion(.failure(WebError.noData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decode = try decoder.decode([T].self, from: data)
                    completion(.success(decode))
                } catch {
                    completion(.failure(WebError.unknown(error)))
                }
            }
        }

        dataTask?.resume()
    }
    
}
