//
//  JobDetailTableViewCell.swift
//  PruebaFactum
//
//  Created by Gustavo on 30/01/22.
//

import UIKit

class JobDetailTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var companyLogo: UIImageView!
    @IBOutlet private weak var nameCompany: UILabel!
    @IBOutlet private weak var titleJob: UILabel!
    @IBOutlet private weak var jobType: UILabel!
    @IBOutlet private weak var salary: UILabel!
    
    static let identifier = "JobDetailTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setDetailJob(job: JobsArrayDTO){
        companyLogo.downloaded(from: job.company_logo ?? "", contentMode: .scaleToFill)
        nameCompany.text = job.company_name
        titleJob.text = job.title
        jobType.text = job.job_type
        salary.text = job.salary == "" ? "Salary not stated" : job.salary
    }
}
