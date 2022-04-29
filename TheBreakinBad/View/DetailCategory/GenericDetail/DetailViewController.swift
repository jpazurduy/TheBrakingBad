//
//  DetailViewController.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/10/21.
//

import UIKit

class DetailViewController: UITableViewController {

    var flag = true
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Description"
        GlobalProgressHUD.hide()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if flag {
            return Detail.getEpisodeDetail().count
        } else {
            return Detail.getDeathDetail().count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell") as! DetailTableViewCell
        
        if flag {
            cell.configure(label: Detail.getEpisodeDetail()[indexPath.row], desc: data[indexPath.row])
        } else {
            cell.configure(label: Detail.getDeathDetail()[indexPath.row], desc: data[indexPath.row])
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if flag {
            if Detail.getEpisodeDetail()[indexPath.row] == "Characters: " {
                return 178
            }
        }
        
        return 44
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if flag {
            return "Episode Details"
        } else {
            return "Death Information"
        }
    }
}
