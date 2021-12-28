//
//  LaunchDetail.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 26.12.21..
//

import SwiftUI

struct LaunchDetailVM {
    
    let missionInfo: String
    let missionImageUrl: String
    let missionSuccess: Bool
    let rocketInfo: String
    let launchFailureDetails: String
    
    var description: String {
        guard missionSuccess else {
            return launchFailureDetails
        }
        
        return "Succesfull launch"
    }
    
    var strokeColor: Color {
        return missionSuccess ? Color.green : Color.red
    }
}

extension LaunchDetailVM {
    init(launchVM: LaunchVM) {
        self.missionInfo = launchVM.missionInfo
        self.missionImageUrl = launchVM.missionImageUrlString
        self.missionSuccess = launchVM.launchSuccess
        self.rocketInfo = launchVM.rocketInfo
        self.launchFailureDetails = launchVM.launchFailureDetails
    }
}
