//
//  HomeRemoteDataManager.swift
//  PruebaFactum
//
//  Created by Gustavo on 30/01/22.
//  
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    var jobsData = JobsDTO()
    
    func getDataJobs(){
        let url = URL(string: "https://remotive.io/api/remote-jobs")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil, let respuesta = response as? HTTPURLResponse else {
                print("Ha habido un error en la conexión \(error!)")
                return
            }
            if respuesta.statusCode == 200 {
                do{
                    self.jobsData = try JSONDecoder().decode(JobsDTO.self,from: data)
                    self.remoteRequestHandler?.remoteDataManagerCallBackData(with: self.jobsData)
                }catch{
                    print("Error: \(error), no se ha podido parsear el archivo")
                }
            } else {
                print("Ha habido un error: \(respuesta.statusCode)")
            }
        }.resume()
    }
}
