//
//  CatalogTableViewController.swift
//  TheBreakingBad
//
//  Created by AvanticaMAC2 on 1/28/21.
//

import UIKit

protocol CategoryView: AnyObject {
    func showCharacters(characters: [Character])
    func showEpisodes(episodes: [Episode])
    func showDeaths(deaths: [DeathInformation])
}

class CategoryTableViewController: UITableViewController {

    // MARK: - Properties
    
    lazy var presenter = CategoryPresenter(viewController: self)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CatalogData.data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = CatalogData.data[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        GlobalProgressHUD.show(viewController: self)
        switch indexPath.row {
        case 0:
            presenter.requestCharacters()
        case 1:
            presenter.requestEpisodes()
        case 2:
            presenter.requestDeaths()
        default:
            GlobalProgressHUD.hide()
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}


// MARK: - CategoryView Methods
extension CategoryTableViewController: CategoryView {
    func showEpisodes(episodes: [Episode]) {

        defer { GlobalProgressHUD.hide()}

        let viewController = EpisodesTableViewController()
        viewController.episodes = episodes
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showCharacters(characters: [Character]) {

        defer { GlobalProgressHUD.hide()}

        let viewController = CharactersCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        viewController.characters = characters.sorted(by: { $0.charId! < $1.charId! })
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showDeaths(deaths: [DeathInformation]) {
        defer { GlobalProgressHUD.hide()}

        let viewController = DeathsTableViewController()
        viewController.deaths = deaths
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
