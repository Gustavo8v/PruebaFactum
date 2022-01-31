//
//  HomeInteractor.swift
//  PruebaFactum
//
//  Created by Gustavo on 30/01/22.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    var arrayJobs = [JobsArrayDTO]()
    
    func interactorGetData() {
        remoteDatamanager?.getDataJobs()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func remoteDataManagerCallBackData(with jobs: JobsDTO){
        for job in jobs.jobs {
            arrayJobs.append(job)
        }
        presenter?.interactorPushDataPresenter(recivedJobs: self.arrayJobs)
    }
}
