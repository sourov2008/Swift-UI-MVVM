//
//  BackendError.swift
//  RME iOS
//
//  Created by Jonathan Müller on 25.11.21.
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
            // If user has no internet conenction then error code is -1020. And the default message is A data connection is not currently allowed. Rather this message more convinent "The internet connection appears to be offline."
            if error.errorCode == -1020 {
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
