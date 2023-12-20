//
//  ApiError.swift
//  CleanMVC
//
//  Created by Ahmed Hamam on 26/11/2023.
//

import Foundation

enum APIError: String, Error {
    case internalError = "internalError"
    case serverError = "serverError"
    case parsingError = "parsingError"
    case urlBadFormmated = "urlBadFormmated"
    case unknownError = "unknownError"
    case errorDecoding = "errorDecoding"
}
