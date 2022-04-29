//
//  EpisodesTableViewController.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/9/21.
//

import UIKit

class DeathsTableViewController: UITableViewController {

    var deaths: [DeathInformation] = []
    lazy var presenter = DeathPresenter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = "Deaths"
        tableView.register(DeathsTableViewCell.nib(), forCellReuseIdentifier: DeathsTableViewCell.identifier)
        print("here")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return deaths.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeathsTableViewCell.identifier) as! DeathsTableViewCell

        let fullName = "Death - " + deaths[indexPath.row].death!
        let season = "Cause - " + deaths[indexPath.row].cause!
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
        viewController.flag = false
        viewController.data = presenter.plainData(death: deaths[indexPath.row])
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}


extension DeathsTableViewController: DeathPresenterView {
    func retrieveDeath(withID: String) {
        print("")
    }
}


