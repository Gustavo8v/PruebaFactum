//
//  HomeView.swift
//  PruebaFactum
//
//  Created by Gustavo on 30/01/22.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {
    
    @IBOutlet private weak var jobsTableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    var arrayJobs = [JobsArrayDTO]()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(view: self)
        presenter?.registerCell(view: self, table: jobsTableView)
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods

    func presenterPushJobs(receivedData: [JobsArrayDTO]) {
        arrayJobs = receivedData
        DispatchQueue.main.async {
            self.jobsTableView.reloadData()
        }
    }
    
    func startActivity() {
        DispatchQueue.main.async {
            self.activityIndicator.layer.cornerRadius = self.activityIndicator.bounds.width / 2
            self.activityIndicator.startAnimating()
            self.activityIndicator.hidesWhenStopped = true
        }
    }
    
    func stopActivity() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayJobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JobDetailTableViewCell.identifier, for: indexPath) as? JobDetailTableViewCell else { return UITableViewCell() }
        cell.setDetailJob(job: self.arrayJobs[indexPath.row])
        return cell
    }
}
