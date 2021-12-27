//
//  LaunchCell.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import SwiftUI

struct LaunchCell: View {
    
    private (set) var viewModel: LaunchVM
    
    var body: some View {
        
        return NavigationLink(destination: LaunchDetail(viewModel: LaunchDetailVM(launchVM: viewModel))) {
            HStack {
                CachedAsyncImage(url: URL(string: viewModel.missionImagePatchUrl))
                    .frame(width: 80, height: 80)
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




