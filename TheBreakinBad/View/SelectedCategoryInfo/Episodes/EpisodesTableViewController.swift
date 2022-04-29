//
//  EpisodesTableViewController.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/9/21.
//

import UIKit

class EpisodesTableViewController: UITableViewController {

    var episodes: [Episode] = []
    lazy var presenter = EpisodesPresenter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Episodes"
        tableView.register(EpisodesTableViewCell.nib(), forCellReuseIdentifier: EpisodesTableViewCell.identifier)
        print("here")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return episodes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodesTableViewCell.identifier) as! EpisodesTableViewCell

        let fullName = episodes[indexPath.row].episode! + " " + episodes[indexPath.row].title!
        let season = "Season " + episodes[indexPath.row].season!
        cell.configure(name: fullName, season: season)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        GlobalProgressHUD.show(viewController: self)
        
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "genericDetail") as! DetailViewController
        viewController.flag = true
        viewController.data = presenter.plainData(episode: episodes[indexPath.row])
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


extension EpisodesTableViewController: EpisodesPresenterView {
    func retrieveEpisodes(episodes: [Episode]) {
        print("aca")
    }
    
    func retrieveEpisodesError(error: WebError) {
        print("aca")
    }
}



