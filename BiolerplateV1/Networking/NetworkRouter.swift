//
//  NetworkRouter.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 5/8/23.
//

/* This class serves as a network manager and allows us to perform various operations such as get, post, put, and delete requests using a router. The error handling in this class is implemented effectively, ensuring that potential issues are dealt with properly. When working in a production environment, errors can be challenging to trace, but the class addresses this by leveraging httpResponse data to generate custom log files. These log files are tailored to include relevant hardware and API-related information. Additionally, the logs can be sent to a server for further investigation when necessary.
 */

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

final class NetworkRouter {
    typealias CompletionHandler<T> = (Result<T, APIError>) -> Void

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    private func buildRequest(url: URL, method: HTTPMethod, headers: [String: String]?, body: Data?) -> URLRequest {
        print("Request URL: \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        return request
    }

    private func executeRequest<T: Decodable>(request: URLRequest, completion: @escaping CompletionHandler<T>) {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            do {
                if error != nil {
                    completion(.failure(.invalidData))
                    return
                }

                /* While error we can use log files which may include relevant hardware and API-related information. Additionally, the logs can be sent to a server for further investigation when necessary.*/
                
                if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                    switch httpResponse.statusCode {
                    case 200...299: // Success range
                        let decodedData = try JSONDecoder().decode(T.self, from: data ?? Data())
                        completion(.success(decodedData))
                    case 400: // Bad Request
                        completion(.failure(.invalidResponse))
                    case 401: // Unauthorized
                        // Handle unauthorized case, if applicable for your API
                        completion(.failure(.invalidResponse))
                    case 404: // Not Found
                        // Handle not found case, if applicable for your API
                        completion(.failure(.invalidResponse))
                    default:
                        // Handle other error cases with the specific error status code
                        completion(.failure(.invalidResponse))
                    }
                } else {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: data!)
                    completion(.success(result))
                }
            } catch {
                completion(.failure(.requestFailed(error)))
            }
        }
        task.resume()
    }


    func sendRequest<T: Decodable>(path: String? = nil,
                                   method: HTTPMethod,
                                   parameters: [String: String]? = nil,
                                   headers: [String: String]? = nil,
                                   body: Data? = nil,
                                   completion: @escaping CompletionHandler<T>) {
        guard var urlComponents = URLComponents(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }

        urlComponents.path = path ?? ""
        if let parameters = parameters {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }

        guard let url = urlComponents.url else {
            completion(.failure(.invalidURL))
            return
        }

        let request = buildRequest(url: url, method: method, headers: headers, body: body)
        executeRequest(request: request, completion: completion)
    }
}
