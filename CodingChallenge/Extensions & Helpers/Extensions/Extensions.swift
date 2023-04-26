//
//  Extensions.swift
//  CodingChallenge
//  Created by Don Wettasinghe on 04/25/23.

import Foundation

extension String {
    /**
     This Function is used to separate the Character's Name from the Full Description.
     
     - Warning:  In order for this function to successfully complete the format for the Full Description  has to be "Character Name - Description". If this isn't the format of the Full Description this function will return "Unknown Character Name"
     
     - Returns: A  String value which will contain the Character Name but if for some reason this function doesn't work properly this function will return "Unknown Character Name"
     */
    func getCharacterName() -> String {
        var characterName: String = "Unknown Character Name"
        
        if let index = self.firstIndex(of: "-") {
            let i = self.index(index, offsetBy: -1)
            characterName = String(self[..<i])
        }
        
        return characterName
    }
    
    /**
     This Function is used to separate the Character's Description from the Full Description.
     
     - Warning:  In order for this function to successfully complete the format for the Full Description  has to be "Character Name - Description". If this isn't the format of the Full Description this function will return "Unknown Character Description"
     
     - Returns: A  String value which will contain the Character Description but if for some reason this function doesn't work properly this function will return "Unknown Character Description"
     */
    func getCharacterDescription() -> String {
        var desc: String = "Unknown Character Description"
        
        if let index = self.firstIndex(of: "-") {
            let i = self.index(index, offsetBy: 2)
            desc = String(self[i...])
        }
        
        return desc
    }
}
