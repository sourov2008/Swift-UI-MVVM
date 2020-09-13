//
//  NetworkRouter.swift
//  AlamofireSwiftyJsonTest
//
//  Created by Shourob Datta on 25/7/19.
//  Copyright © 2019 OrganizationName. All rights reserved.
//

import Foundation
import Alamofire


enum NetworkRouter: URLRequestConvertible {
    
    
    static let baseURLString = baseURL
    
    case postGeneric(String, [String: Any])
    case deleteGeneric(String)
    case updateGeneric(String, [String: Any])
    
    
    case fetchDataFormEndpoint(String)
    
    
    
    
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod{
            switch self {
            case  .fetchDataFormEndpoint:
                return .get
            case  .postGeneric:
                return .post
            case .deleteGeneric:
                return .delete
            case .updateGeneric:
                return .put
            }
        }
        
        
        
        
        let params: ([String: Any]?) = {
            switch self {
                
                
            case .deleteGeneric, .fetchDataFormEndpoint:
                return nil

            case .postGeneric(let endPoint, let paramDict):
                return paramDict
                
            case .updateGeneric(let endPoint, let paramDict):
                return paramDict
            }
            
        }()
        
        
        
        
        let url: URL = {
            // build up and return the URL for each endpoint
            let relativePath: String?
            switch self {

                
            case .postGeneric(let endPoint, let paramDict):
                relativePath = endPoint

            case .deleteGeneric(let endPoint):
                relativePath = endPoint
            case .updateGeneric(let endPoint, let paramDict):
                relativePath = endPoint
            case .fetchDataFormEndpoint(let path):
                relativePath = path
                
                
            }
            var url = URL(string: NetworkRouter.baseURLString)!
            if let relativePath = relativePath {
                
                let fullUrl = NetworkRouter.baseURLString+relativePath
                url = URL(string: fullUrl)!
                
            }
            return url
        }()
        
        let networkHelper = NetworkHelper()
        networkHelper.checkConnectivity()
        
        //        networkHelper.checkConnectivity()
        
        
        var headers: HTTPHeaders {
            var header = HTTPHeaders()

            
            
            let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjY4MDQsImV4cCI6MTYyNjQ0NDgwMywic2NvcGUiOiJjcmVkLXVzZXIifQ.kPeo0Rg46dyUi3O8GFsGHuZK0lqB912eb3ryJjHfM1Y"
                
                var bearer: String = "Bearer "
                bearer += token
                header["Authorization"] = bearer
            
            return header
            
        }
        
        
        
        var urlRequest: URLRequest {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            headers.forEach { request.addValue($1, forHTTPHeaderField: $0) }
            request.setValue("application/json", forHTTPHeaderField: "Accept")//set special header value
            
            return request
        }
        
        
        
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        
        
        return try encoding.encode(urlRequest, with: params)
        
        
    }
    
    
}

