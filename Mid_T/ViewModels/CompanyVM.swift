//
//  CompanyVM.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import Foundation
import SwiftUI

class CompanyVM: ObservableObject {
    
    @Published var companyInfo = "Loading company info..."
    
    init() {
        fetchCompanyData()
    }
    
    func fetchCompanyData() {
        let apiUrl = "https://api.spacexdata.com/v3/info"
        guard let url = URL(string: apiUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            DispatchQueue.main.async {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let company = try! jsonDecoder.decode(Company.self, from: data!)
                self.companyInfo = self.getCompanyInfo(fromCompany: company)
            }
        }.resume()
    }
    
    func getCompanyInfo(fromCompany company: Company) -> String {
        return "\(company.name) was founded by \(company.name) in \(company.founded). It has now \(company.employees) employees, \(company.launchSites) launch sites, and is valued at  \(self.getFormatedNumber(fromNumber: company.valuation)) USD."
    }
    
    func getFormatedNumber(fromNumber number: Int) -> String {
        let formater = NumberFormatter()
        formater.numberStyle = .currencyAccounting
        return formater.string(from: NSNumber(value: number)) ?? ""
    }
}
