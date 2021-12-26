//
//  LaunchCell.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import SwiftUI

struct LaunchCell: View {
    
    private (set) var launch: Launch
    
    var body: some View {
        
        return NavigationLink(destination: LaunchDetail(launch: launch)) {
            HStack {
                Image("Gabriel Theodoropoulos")
                    .cornerRadius(40)
                VStack(alignment: .leading, spacing: 10, content: {
                    LaunchCellInfoView(descriptionTuple: ("Mission: ", launch.missionName))
                    LaunchCellInfoView(descriptionTuple: ("Date/time: ", launch.missionName))
                    LaunchCellInfoView(descriptionTuple: ("Rocket: ","\(launch.rocket.rocketName)/\(launch.rocket.rocketType)"))
                    LaunchCellInfoView(descriptionTuple: ("Days: ", launch.missionName))
                })
                Spacer()
                Image("c_mark")
            }
        }
       
        
    }
}

struct LaunchCellInfoView: View {
    private (set) var descriptionTuple: (labelDescription: String, labelValue: String)

    var body: some View {
        HStack {
            Text(descriptionTuple.labelDescription)
                .font(Font.headline.weight(.bold))
            Text(descriptionTuple.labelValue)
                .font(Font.headline.weight(.light))
        }
    }
}

struct LaunchDetail: View {
    private (set) var launch: Launch
    
    var body: some View {
        Text(launch.missionName)
    }
}
