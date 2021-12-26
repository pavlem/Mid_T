//
//  CompanyVM.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import Foundation
import SwiftUI

class CompanyVM: ObservableObject {
    
    // MARK: - API
    @Published var companyInfo = "Loading company info..."
    
    // MARK: - Inits
    init() {
        dataTask = companyService.fetchCopmanyInfo { result in
            switch result {
            case .success(let company):
                if let company = company {
                    DispatchQueue.main.async {
                        self.companyInfo = self.getCompanyInfo(fromCompany: company)
                    }
                }
            case .failure(let error):
                print(error)
                // handle error
            }
        }
    }
    
    deinit {
        dataTask?.cancel()
    }
    
    // MARK: - Properties
    private var dataTask: URLSessionDataTask?
    private let companyService = SpacexService()
    
    // MARK: - Helper
    func getCompanyInfo(fromCompany company: Company) -> String {
        return "\(company.name) was founded by \(company.name) in \(company.founded). It has now \(company.employees) employees, \(company.launchSites) launch sites, and is valued at  \(self.getFormatedNumber(fromNumber: company.valuation)) USD."
    }
    
    func getFormatedNumber(fromNumber number: Int) -> String {
        let formater = NumberFormatter()
        formater.numberStyle = .currencyAccounting
        return formater.string(from: NSNumber(value: number)) ?? ""
    }
}
