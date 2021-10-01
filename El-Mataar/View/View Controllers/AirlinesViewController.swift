//
//  AirlinesViewController.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 01/10/2021.
//

import UIKit

class AirlinesViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Countries"
        setupTableView()
    }
    
}

//MARK:- TableView
extension AirlinesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: AirlinesTableViewCell.self, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

