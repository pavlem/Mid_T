//
//  Launch.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import Foundation

struct Launch: Decodable, Identifiable {
    var id = UUID()
    let missionName: String
    let launchDateUnix: Int
    let launchDateUtc: String
    let launchDateLocal: String
    let rocket: LaunchRocket
    let links: Links
    let launchSuccess: Bool?
    let launchFailureDetails: LaunchFailureDetails?
    let details: String?
    let launchYear: String
    
    private enum CodingKeys: CodingKey {
        case missionName, launchDateUnix, launchDateUtc, launchDateLocal, rocket, links, launchSuccess, launchFailureDetails, details, launchYear
    }

}

struct Links: Decodable {
    let missionPatchSmall: String?
}

struct LaunchRocket: Decodable {
    let rocketName: String
    let rocketType: String
}

struct LaunchFailureDetails: Decodable {
    let reason: String
}
