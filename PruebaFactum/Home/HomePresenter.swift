//
//  HomePresenter.swift
//  PruebaFactum
//
//  Created by Gustavo on 30/01/22.
//  
//

import UIKit

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    
    func registerCell(view: HomeView, table: UITableView) {
        table.register(UINib(nibName: JobDetailTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: JobDetailTableViewCell.identifier)
        table.delegate = view.self
        table.dataSource = view.self
    }
    
    func viewDidLoad(view: HomeView) {
        view.startActivity()
        view.navigationItem.title = "Jobs"
        interactor?.interactorGetData()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func interactorPushDataPresenter(recivedJobs: [JobsArrayDTO]) {
        view?.presenterPushJobs(receivedData: recivedJobs)
        view?.stopActivity()
    }
}
