//
//  ApiError.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 02/05/23.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        // user feedback
        switch self {
        case .badURL, .parsing, .unknown:
            return Prompt.Network.somethingWrong
        case .badResponse(_):
            return Prompt.Network.connectionFailed
        case .url(let error):
            return error?.localizedDescription ?? Prompt.Network.somethingWrong
        }
    }
    
    var description: String {
        //info for debugging
        switch self {
        case .unknown: return Prompt.Network.unknownError
        case .badURL: return Prompt.Network.invalidURL
        case .url(let error):
            return error?.localizedDescription ?? Prompt.Network.urlSessionError
        case .parsing(let error):
            return String(format: Prompt.Network.parsingError, arguments: [(error?.localizedDescription ?? "")])
        case .badResponse(statusCode: let statusCode):
            return String(format: Prompt.Network.badResponse, arguments: ["\(statusCode)"])
        }
    }
}
