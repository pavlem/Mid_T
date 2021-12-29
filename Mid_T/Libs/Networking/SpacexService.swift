//
//  SpacexService.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 26.12.21..
//

import Foundation
import UIKit

class SpacexService: NetworkService {
    
    // MARK: - API
    func fetchCopmanyInfo(completion: @escaping (Result<Company?, NetworkError>) -> ()) -> URLSessionDataTask? {
        return load(urlString: urlString, path: pathCompany, method: .get, params: nil, headers: nil) { (result: Result<Company?, NetworkError>) in
            completion(result)
        }
    }
    
    func fetchLaunches(completion: @escaping (Result<[Launch]?, NetworkError>) -> ()) -> URLSessionDataTask? {
        return load(urlString: urlString, path: pathLaunches, method: .get, params: nil, headers: nil) { (result: Result<[Launch]?, NetworkError>) in
            completion(result)
        }
    }

    // MARK: - Properties
    private let scheme = "https://"
    private let host = "api.spacexdata.com/"
    private let pathCompany = "v3/info"
    private let pathLaunches = "v3/launches"

    private var urlString: String {
        return scheme + host
    }
}
