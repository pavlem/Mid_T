//
//  LaunchesVM.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import Foundation

class LaunchesVM: ObservableObject {
    
    // MARK: - API
    @Published var launchesInfo = LaunchesVM.launchesLoading
    @Published var launches = [Launch]()
    
    static var launchesLoading = "LAUNCHES - Loading..."
    static var launchesLoadingDone = "LAUNCHES"
    
    // MARK: - Inits
    init() {
        dataTask = companyService.fetchLaunches { result in
            switch result {
            case .success(let launches):
                if let launches = launches {
                    DispatchQueue.main.async {
                        self.launches = launches
                        self.launchesInfo = LaunchesVM.launchesLoadingDone
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
}
