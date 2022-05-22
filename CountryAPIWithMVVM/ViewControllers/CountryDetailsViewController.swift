//
//  ViewController.swift
//  myctApi
//
//  Created by Abhi Thummar on 27/03/22.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var countryTableView: UITableView!
    
    //MARK: - Variables
    var arrayOfCountry: [Population] = []
    var viewModel: CountryViewModel = CountryViewModel()
    
    //MARK: - View Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        loadOrders()
        setUpTableView()
    }
    private func setUpTableView() {
        countryTableView.estimatedRowHeight = 300
        countryTableView.rowHeight = UITableView.automaticDimension
    }
    func loadOrders() {
        viewModel.loadCountry { isAPISuccess, apiFailureMessage in
            if isAPISuccess {
                self.countryTableView.reloadData()
            } else {
                print("Alert ma \(apiFailureMessage) message joi lo")
            }
        }
    }
}

//MARK: - TableView Delegate & DataSource Methos
extension CountryDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections (in tableView: UITableView) -> Int { return 1 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return viewModel.numberOfRowInSection() }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "Nation Name:- \(arrayOfCountry[indexPath.row].nationName)\n & \nPopulation:- \(arrayOfCountry[indexPath.row].population)"
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textAlignment = .center
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }


    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 1) {
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}
