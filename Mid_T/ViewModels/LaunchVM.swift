//
//  LaunchVM.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 27.12.21..
//

import SwiftUI
import UIKit

struct LaunchVM {
    
//    launchDateUnix: 1217734440, launchDateUtc: "2008-08-03T03:34:00.000Z", launchDateLocal: "2008-08-03T15:34:00+12:00",  links: Mid_T.Links(missionPatchSmall: Optional("https://images2.imgbox.com/3d/86/cnu0pan8_o.png")),)
    
    let launch: Launch
    
    var missionImagePatchUrl: String {
        return launch.links.missionPatchSmall ?? ""
    }
    
    let missionNameLabel: String = "Mission: "
    let dateTimeLabel: String = "Date/time: "
    let rocketLabel: String = "Rocket: "
    
    var missionInfo: String {
        return launch.missionName
    }
    
    var launchDate: Date {
        return Date(timeIntervalSince1970: Double(launch.launchDateUnix))
    }
    
    var dateTimeInfo: String {
        let date = launchDate
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    
    var rocketInfo: String {
        return "\(launch.rocket.rocketName)/\(launch.rocket.rocketType)"
    }
    
    var daysLabel: String {
        let sinceOrFrom = launchDate > Date() ? "since" : "from"
        return "Days \(sinceOrFrom) now: "
    }
    
    var daysInfo: String {
        
        let diff = Date.daysBetween(start: launchDate, end: Date()) // 365

        return String(diff)
    }
    
    var launchSuccess: Bool {
        return launch.launchSuccess ?? false
    }
    
    var launchFailureDetails: String {
        guard let reason = launch.launchFailureDetails?.reason else { return "" }
        guard let details = launch.details else { return "" }
        return details + ". \n\n" + "Reason:\n" + reason.firstUppercased + "."
    }
    
    var missionImageUrlString: String {
        return launch.links.missionPatchSmall ?? ""
    }
    
    var imageSuccessIconName: String {
        return launchSuccess ? "c_mark" : "x_mark"
    }
}
