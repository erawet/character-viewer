//
//  Helpers.swift
//  CodingChallenge
//  Created by Don Wettasinghe on 04/25/23.

import Foundation

enum APIError: Error {
    case incorrectURL
    case responseError
    case parsingJSONError
    
    var localizedDescription: String {
        switch self {
        case .incorrectURL:
            return "The URL is Incorrect."
        case .responseError:
            return "An Error Occured while fetching data."
        case .parsingJSONError:
            return "An Error Occured while trying to Parse JSON."
        }
    }
}

enum Storyboards: String {
    case Main
    
    enum Identifiers: String {
        case characterDetailsView
    }
}

enum CustomCellNibNames: String {
    case CharacterTVCell
}
