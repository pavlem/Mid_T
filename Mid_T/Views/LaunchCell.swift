//
//  LaunchCell.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import SwiftUI

struct LaunchVM {
    
    let launch: Launch
    
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

struct LaunchCell: View {
    
    private (set) var viewModel: LaunchVM
    
    var body: some View {
        
        return NavigationLink(destination: LaunchDetail(viewModel: viewModel)) {
            HStack {
                Image("Gabriel Theodoropoulos")
                    .cornerRadius(40)
                VStack(alignment: .leading, spacing: 10, content: {
                    LaunchCellInfoView(descriptionTuple: (viewModel.missionNameLabel, viewModel.missionInfo))
                    LaunchCellInfoView(descriptionTuple: (viewModel.dateTimeLabel, viewModel.dateTimeInfo))
                    LaunchCellInfoView(descriptionTuple: (viewModel.rocketLabel, viewModel.rocketInfo))
                    LaunchCellInfoView(descriptionTuple: (viewModel.daysLabel, viewModel.daysInfo))
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
    private (set) var viewModel: LaunchVM
    
    var body: some View {
        Text(viewModel.missionInfo)
    }
}
