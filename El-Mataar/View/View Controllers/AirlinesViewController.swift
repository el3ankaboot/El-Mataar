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
    
    //MARK:- Variables
    private var viewModel = AirLinesTableViewModel()
    
    //MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Countries"
        setupTableView()
        getData()
    }
    
    //MARK: GetData
    func getData(){
        self.animateActivityIndicator(activityIndicator)
        viewModel.getData()
        viewModel.airLinesDataSource.bind {[weak self] _ in
            self?.tableView.reloadData()
            if let activityIndicator = self?.activityIndicator{
                self?.stopAnimating(activityIndicator)
            }
            
        }
        viewModel.didFail.bind { [weak self] fail in
            if fail {
                self?.showErrorAlert()
            }
        }
        
    }
    
    //MARK:- Actions
    @IBAction func didPressAddAirline(_ sender: Any) {
        Router.openSheet(.addAirLines, withSizes: [.percent(0.7),.percent(0.95)])
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

