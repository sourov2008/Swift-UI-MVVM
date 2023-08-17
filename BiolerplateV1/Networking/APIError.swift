//
//
//  
//
//  Created by Shourob Datta on 16/8/23.
//

import Foundation

enum APIError: Error {
    case requestFailed(Error)
    case invalidData
    case decodingError
    case invalidURL
    case invalidResponse
    case network

    // Add more error cases as per your requirements
    
}


/* This extension is used for customise the error. There might have default error or user defined error.*/

extension APIError {

    func getErrorMessage() -> String {
        var errorString = "Unknown error"

        switch self {

        case let .requestFailed(error):

            if error.errorCode == Constant.ErrorCode.offline {
                errorString = "Internet conenction appears to be offline."
            } else {
                errorString = error.localizedDescription
            }

        /*You can configure your own message here.*/
            
        case .invalidData:
            errorString = "invalid request."

        case .decodingError:
            errorString = "decoding request."

        case .invalidURL:
            errorString = "invalid request."

        case .invalidResponse:
            errorString = "invalid response."

        case .network:
            errorString = "unknown network response."
        }

        return errorString

    }

}

extension Error {
    var errorCode: Int? {
        (self as NSError).code
    }
}
