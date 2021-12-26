//
//  LaunchesVM.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import Foundation

class LaunchesVM: ObservableObject {
    
    @Published var launches = [Launch]()
    
    func fetchLaunches() {
        let apiUrl = "https://api.spacexdata.com/v3/launches"
        guard let url = URL(string: apiUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            DispatchQueue.main.async {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                self.launches = try! jsonDecoder.decode([Launch].self, from: data!)
            }
        }.resume()
    }

}
