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
    let successfulStateText: String
    let failureStateText: String

    var isSusccessfulLaunch: Bool? {
        if successfulState == successfulStateText {
            return true
        } else if successfulState == failureStateText {
            return false
        }
        return nil
    }
    
    var isOrderAssceding: Bool {
        if order == "ASC" { return true }
        return false
    }
}

class LaunchesVM: ObservableObject {
    
    // MARK: - API
    @Published var launchesInfoTitle = LaunchesVM.launchesLoadingText
    @Published var launches = [Launch]()
    @Published var isLoading = true
        
    func resetFilters() {
        launches = originalLaunches
    }
    
    func filter(filterObject: LaunchesFilterObject) {
        
        // filtering by year
        if let _ = Int(filterObject.year) {
            launches = launches.filter { $0.launchYear == filterObject.year }
        }
        
        // filtering by successful launch
        if let isSuccessLaunchSeleceted = filterObject.isSusccessfulLaunch {
            launches = launches.filter {$0.launchSuccess == isSuccessLaunchSeleceted }
        }
        
        // filtering by order (ascending or descending)
        if filterObject.isOrderAssceding {
            launches = launches.sorted(by: { $0.launchYear < $1.launchYear })
        } else {
            launches = launches.sorted(by: { $0.launchYear > $1.launchYear })
        }
    }

    static var launchesLoadingText = "LAUNCHES - Loading..."
    static var launchesLoadingDoneText = "LAUNCHES"
    static var applyFiltersText = "Apply filters"
    static var resetFiltersText = "Reset filters"
    
    var launchesByYear: [String] {
        let years = originalLaunches.map { $0.launchYear }
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
                        self.isLoading = false
                    }
                }
            case .failure(_):
                // TODO: - handle error
                DispatchQueue.main.async {
                    self.isLoading = false
                }
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
