//
//  DetailsViewController.swift
//  CodingChallenge
//  Created by Don Wettasinghe on 04/25/23.

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var characterImgView: UIImageView!
    @IBOutlet var characterNameLbl: UILabel!
    @IBOutlet var characterDescriptionLbl: UILabel!
    
    // MARK: - Variables & Constants
    var detailViewModel: CharacterDetailsViewModel?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    
    // MARK: - Functions
    func configureView() {
        if let viewModel = self.detailViewModel {
            self.characterImgView.image = UIImage(named: "no-image")

            viewModel.getCharacterImg { [weak self] (characterImg) in
                if characterImg != nil {
                    self?.characterImgView.image = characterImg
                }
            }
            
            self.characterNameLbl.text = viewModel.characterName
            self.characterDescriptionLbl.text = viewModel.characterDescription
        }
    }
}
