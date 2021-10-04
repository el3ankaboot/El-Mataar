//
//  AirlinesViewController.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 01/10/2021.
//

import UIKit
import FittedSheets

class AirlinesViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK:- Variables
    private var viewModel = AirLinesTableViewModel(service: ElMataarService())
    
    //MARK: Refresh Control
    private let refreshControl = UIRefreshControl()
    
    //MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Countries"
        setupTableView()
        getData()
        setupRefreshControl()
    }
    
    //MARK: GetData
    func getData(){
        self.animateActivityIndicator(activityIndicator)
        viewModel.getData()
        viewModel.airLinesDataSource.bind {[weak self] _ in
            self?.tableView.reloadData()
            if let activityIndicator = self?.activityIndicator{
                self?.stopAnimating(activityIndicator)
                self?.refreshControl.endRefreshing()
            }
            
        }
        viewModel.didFail.bind { [weak self] fail in
            if fail {
                self?.showErrorAlert()
                self?.refreshControl.endRefreshing()
            }
        }
        
    }
    
    //MARK:- Actions
    @IBAction func didPressAddAirline(_ sender: Any) {
        Router.openSheet(.addAirLines, withSizes: [.percent(0.7),.percent(0.95)])
    }
    
    @IBAction func didPressSearch(_ sender: Any) {
        if let searchText = searchTextField.text {
            viewModel.search(forName: searchText)
        }
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        if !((sender as! UITextField).isNotEmpty()){
            viewModel.search(forName: "")
        }
    }
    
    
}

//MARK:- TableView
extension AirlinesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getAirLinesTableViewCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: AirlinesTableViewCell.self, for: indexPath)
        let cellViewModel = viewModel.getAirLineForRow(indexPath.row)
        cell.configureCell(withViewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.handleCellSelection(indexPath.row)
    }
    
}

//MARK:- Refresh Control
extension AirlinesViewController {
    func setupRefreshControl(){
        tableView.refreshControl = refreshControl
        refreshControl.tintColor = UIColor(named: K.airLinesRed)
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    
    @objc private func refreshData(_ sender: Any) {
        self.getData()
    }
}

