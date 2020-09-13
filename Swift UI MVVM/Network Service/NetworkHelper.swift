//
//  NetworkHelper.swift
//  GpEmployee
//
//  Created by Shourob Datta (Wipro Macbook) on 13/11/19.
//  Copyright © 2019 Benzamin Basher. All rights reserved.
//

import Foundation
import Foundation
import Alamofire



public enum MyError: Error {
    case customError
}



extension MyError : LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .customError:
            return NSLocalizedString("I failed.", comment: "")
        }
    }
    public var failureReason: String? {
        switch self {
        case .customError:
            return NSLocalizedString("I don't know why.", comment: "")
        }
    }
    public var recoverySuggestion: String? {
        switch self {
        case .customError:
            return NSLocalizedString("Switch it off and on again.", comment: "")
        }
    }
}


class NetworkHelper {
    
    
    var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    
    func getGeneralizedErrorMessageFromErrorSwiftVersion(errorData: AnyObject) -> Error {
        
        
//        //check if its expired token error
//        if errorData["message"] != nil && errorData["code"] != nil {
//            if ((errorData["code"] as? NSNumber)?.intValue ?? 0 == 401) || (((errorData["code"] as? NSNumber)?.intValue ?? 0 == 500) && (errorData["message"] as! String == "Expired token")) {
//                SessionManager.singletony().renewToken()
//                let error = NSError(domain:"Token expired, trying to renew. Please try again", code:Int(APIErrorExpiredToken.rawValue), userInfo:[ NSLocalizedDescriptionKey: "Error : Token expired, trying to renew. Please try again"])
//                return error
//            }
//        }
//
//        //otherwise through a general message
//        if errorData["message"] != nil {
//            let errormessage = errorData["message"] as? String
//            return NSError(domain: errormessage ?? "", code: Int(APIErrorUnknown.rawValue), userInfo: [ NSLocalizedDescriptionKey: "Error : \(errormessage ?? "")"])
//        }
        return NSError(domain: "Unknown error occured" , code: 0, userInfo: [ NSLocalizedDescriptionKey: "Error :  Unknown error occured" ])
    }

    
    
    
    
    
    func checkConnectivity() {
        
        if self.isConnectedToInternet {
            print("Yes! internet is available.")
            // do some tasks..
        }
            
        else {
            print("No internet is available.")
        }
    }



}

