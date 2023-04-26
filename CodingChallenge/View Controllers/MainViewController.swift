//
//  MainViewController.swift
//  CodingChallenge
//  Created by Don Wettasinghe on 04/25/23.

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Variables & Constants
    let viewModel = CharacterListViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = AppConfiguration.appName
        
        self.setupAPI()
        self.configureSearchBar()
        self.configureTableView()
    }
    
    // Fetch Data from API and reload `UITableView`
    func setupAPI() {
        self.viewModel.fetchCharacters { [weak self] (error) in
            if let error = error {
                self?.showDefaultAlert(title: "Error", message: error.localizedDescription)
            } else {
                self?.tableView.reloadData()
            }
        }
    }
    
    // Configures Search Bar
    func configureSearchBar() {
        self.searchBar.delegate = self
        self.searchBar.placeholder = "Search Characters"
    }
    
    // Configures Table View
    func configureTableView() {
        let characterCellXib = UINib(nibName: CustomCellNibNames.CharacterTVCell.rawValue, bundle: nil)
        self.tableView.register(characterCellXib, forCellReuseIdentifier: self.viewModel.characterCellID)
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getCharacterListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: self.viewModel.characterCellID, for: indexPath) as? CharacterTVCell else { return UITableViewCell() }
        cell.configureCell(viewModel: self.viewModel, rowNumber: indexPath.row)
        return cell
    }
    
    // UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = UIStoryboard(name: Storyboards.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier: Storyboards.Identifiers.characterDetailsView.rawValue) as? DetailsViewController else { return }
        
        let character = viewModel.getCharacter(at: indexPath.row)
        detailViewController.detailViewModel = CharacterDetailsViewModel(character: character)
        splitViewController?.showDetailViewController(detailViewController, sender: nil)
    }
}

// MARK: - UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.searchText = searchText
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
