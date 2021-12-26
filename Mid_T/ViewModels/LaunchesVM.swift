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
    
    init() {
        fetchLaunches(fromUrl: apiUrl)
    }
    
    static var launchesLoading = "LAUNCHES - Loading..."
    static var launchesLoadingDone = "LAUNCHES"
    private let apiUrl = "https://api.spacexdata.com/v3/launches"
    
    private func fetchLaunches(fromUrl: String) {
        guard let url = URL(string: apiUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            DispatchQueue.main.async {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                self.launches = try! jsonDecoder.decode([Launch].self, from: data!)
                self.launchesInfo = LaunchesVM.launchesLoadingDone
            }
        }.resume()
    }

}
