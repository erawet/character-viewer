//
//  CharacterListViewModel.swift
//  CodingChallenge
//  Created by Don Wettasinghe on 04/25/23.

import Foundation

class CharacterListViewModel {
    
    // Cell ID
    let characterCellID = "CharacterCell"
    
    // Object Arrays
    var characters: [RelatedTopic] = [RelatedTopic]()
    private var filteredCharacterList: [RelatedTopic] = [RelatedTopic]()
    
    var searchText: String = "" {
        didSet {
            self.getFilteredCharacters()
        }
    }
    
    func fetchCharacters(completion: @escaping (APIError?) -> Void) {
        APIHelper.shared.fetchCharacters() { [weak self] (character, error) in
            if let error = error {
                completion(error)
            } else if let character = character {
                DispatchQueue.main.async {
                    self?.characters = character.relatedTopics
                    self?.filteredCharacterList = character.relatedTopics
                    completion(nil)
                }
            }
        }
    }
    
    /**
     This function gets the Count from Characters Object Array.
     
     - Returns: An integer containing the Character Object Coount
     */
    func getCharacterListCount() -> Int {
        self.getFilteredCharacters()
        return self.filteredCharacterList.count
    }
    
    /**
     This function uses the provided index and returns the `Character` Object.
     
     - Parameter index: The index location to search in the Character's Object Array.
     
     - Returns: An object of `RelatedTopic`
     */
    func getCharacter(at index: Int) -> RelatedTopic {
        return self.filteredCharacterList[index]
    }
    
    func getCharacterName(at index: Int) -> String {
        return self.getCharacter(at: index).characterFullDescription.getCharacterName()
    }
    
    func getCharacterDescription(at index: Int) -> String {
        return self.getCharacter(at: index).characterFullDescription.getCharacterDescription()
    }
    
    /**
     This function is used to filter data
     */
    func getFilteredCharacters() {
        if self.searchText.isEmpty {
            self.filteredCharacterList = self.characters
        } else {
            self.filteredCharacterList = self.characters.filter({
                $0.characterFullDescription.getCharacterName().uppercased().contains(self.searchText.uppercased()) || $0.characterFullDescription.getCharacterDescription().uppercased().contains(self.searchText.uppercased())
            })
        }
    }
    
}
