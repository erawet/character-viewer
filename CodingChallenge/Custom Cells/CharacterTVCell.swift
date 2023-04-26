//
//  CharacterTVCell.swift
//  CodingChallenge
//  Created by Don Wettasinghe on 04/25/23.


import UIKit

class CharacterTVCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var characterNameLbl: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Helper Functions
    func configureCell(viewModel: CharacterListViewModel, rowNumber: Int) {
        self.characterNameLbl.text = viewModel.getCharacterName(at: rowNumber)
    }
}
