//
//  LaunchesVM.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import Foundation


struct LaunchesFilterObject {
    let year: String
    let order: String
    let successfulState: String
    
}

class LaunchesVM: ObservableObject {
    
    // MARK: - API
    @Published var launchesInfoTitle = LaunchesVM.launchesLoadingText
    @Published var launches = [Launch]()
        
    func resetLaunches() {
        launches = originalLaunches
    }
    
    func filter(filterObject: LaunchesFilterObject) {
        print(filterObject)
    }

    static var launchesLoadingText = "LAUNCHES - Loading..."
    static var launchesLoadingDoneText = "LAUNCHES"
    static var applyFiltersText = "Apply filters"
    static var resetFiltersText = "Reset filters"
    
    var launchesByYear: [String] {
        let years = launches.map { $0.launchYear }
        let yearsFiltered = [String](Set(years.map {$0})).sorted()
        return yearsFiltered
    }
    
    // MARK: - Inits
    init() {
        dataTask = networkService.fetchLaunches { result in
            switch result {
            case .success(let launches):
                if let launches = launches {
                    DispatchQueue.main.async {
                        self.launches = launches
                        self.originalLaunches = launches
                        self.launchesInfoTitle = LaunchesVM.launchesLoadingDoneText
                    }
                }
            case .failure(let error):
                print(error)
                // TODO: - handle error
            }
        }
    }
    
    deinit {
        dataTask?.cancel()
    }
    
    // MARK: - Properties
    private var originalLaunches = [Launch]()
    private var dataTask: URLSessionDataTask?
    private let networkService = SpacexService()
}
