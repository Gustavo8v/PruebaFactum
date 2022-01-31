//
//  HomeProtocols.swift
//  PruebaFactum
//
//  Created by Gustavo on 30/01/22.
//  
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    func presenterPushJobs(receivedData: [JobsArrayDTO])
    func startActivity()
    func stopActivity()
}

protocol HomeWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
}

protocol HomePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad(view: HomeView)
    func registerCell(view: HomeView, table: UITableView)
}

protocol HomeInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushDataPresenter(recivedJobs: [JobsArrayDTO])
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    
    func interactorGetData()
}

protocol HomeDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    
    func getDataJobs()
}

protocol HomeRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerCallBackData(with category: JobsDTO)
}

protocol HomeLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
