//
//  ViewController.swift
//  workingWithTheNetwork
//
//  Created by Kirill Drozdov on 07.11.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var dataSource = [Posts]()
    let networkManager = NetworkManager()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.obtainPost { (posts) in
            self.dataSource = posts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } failrureComletion: { (error) in
            print(error.localizedDescription)
        }
    }
    //MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let post = dataSource[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        
        return cell
    }
    
}

