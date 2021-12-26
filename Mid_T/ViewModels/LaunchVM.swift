//
//  LaunchVM.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 27.12.21..
//

import Foundation

struct LaunchVM {
    
    let launch: Launch
    
    var missionImagePatch: String {
        return launch.links.missionPatchSmall ?? ""
    }
    
    let missionNameLabel: String = "Mission: "
    let dateTimeLabel: String = "Date/time: "
    let rocketLabel: String = "Rocket: "

    var daysLabel: String {
        return "Days: "
    }
    
    var missionInfo: String {
        return launch.missionName
    }
    
    var dateTimeInfo: String {
        return "Days: "
    }
    
    var rocketInfo: String {
        return "\(launch.rocket.rocketName)/\(launch.rocket.rocketType)"
    }
    
    var daysInfo: String {
        return "56"
    }
}
