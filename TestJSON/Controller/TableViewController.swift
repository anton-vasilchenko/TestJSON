//
//  TableViewController.swift
//  TestJSON
//
//  Created by Антон Васильченко on 30.01.2021.
//

import UIKit
import Kingfisher

class TableViewController: UITableViewController {

    var json: [PryanikyJSON] = []
    var blockItems: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PictureTableViewCell", bundle: nil), forCellReuseIdentifier: "PictureTableViewCell")

        let networkManager = NetworkManager()
        networkManager.loadJSON { [weak self] (data) in
            self?.json = data
            self?.blockItems = data[0].view
            self?.tableView.reloadData()

        }
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blockItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        switch blockItems[indexPath.row] {
        case "hz":
            let block = json[0].data.filter {$0.name == "hz"}
            cell.textLabel?.text = block[0].name
            cell.detailTextLabel?.text = block[0].data.text
        case "picture":
            let cell = tableView.dequeueReusableCell(withIdentifier: "PictureTableViewCell", for: indexPath) as! PictureTableViewCell
            let block = json[0].data.filter {$0.name == "picture"}
            cell.firstLabel?.text = block[0].name
            cell.secondLabel?.text = block[0].data.url
            cell.thirdLabel?.text = block[0].data.text
            let url = URL(string: block[0].data.url ?? "")
            cell.pictureView.kf.setImage(with: url)
            return cell
        case "selector":
            let block = json[0].data.filter {$0.name == "selector"}
            cell.textLabel?.text = block[0].name
            let selectedID = block[0].data.selectedID
            cell.detailTextLabel?.text = block[0].data.variants?[selectedID! - 1].text
        default:
            print("default")
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let initItem = json[0].view[indexPath.row]
        let message = initItem + " " + String(indexPath.row)
        let alert = UIAlertController(title: "Init item", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
}
