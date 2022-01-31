//
//  HomeEntity.swift
//  PruebaFactum
//
//  Created by Gustavo on 30/01/22.
//

import Foundation

struct JobsDTO: Codable {
    var jobs: [JobsArrayDTO] = []
}

struct JobsArrayDTO: Codable {
    var id: Int?
    var url: String?
    var title: String?
    var company_name: String?
    var company_logo: String?
    var category: String?
    var job_type: String?
    var publication_date: String?
    var candidate_required_location: String?
    var salary: String?
    var description: String?
}
