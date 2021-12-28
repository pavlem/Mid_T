//
//  LaunchCell.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import SwiftUI

struct LaunchCell: View {
    
    private (set) var viewModel: LaunchVM
    
    private let imageFrameWidth = CGFloat(50)
    private let imageFrameHeight = CGFloat(50)
    private let spacing = CGFloat(8)
    
    var body: some View {
        
        return NavigationLink(destination: LaunchDetail(viewModel: LaunchDetailVM(launchVM: viewModel))) {
            HStack {
                CachedAsyncImage(url: URL(string: viewModel.missionImagePatchUrl))
                    .frame(width: imageFrameWidth, height: imageFrameWidth)
                    .cornerRadius(imageFrameWidth / 2)
                VStack(alignment: .leading, spacing: spacing, content: {
                    LaunchCellInfoView(descriptionTuple: (viewModel.missionNameLabel, viewModel.missionInfo))
                    LaunchCellInfoView(descriptionTuple: (viewModel.dateTimeLabel, viewModel.dateTimeInfo))
                    LaunchCellInfoView(descriptionTuple: (viewModel.rocketLabel, viewModel.rocketInfo))
                    LaunchCellInfoView(descriptionTuple: (viewModel.daysLabel, viewModel.daysInfo))
                })
                Spacer()
                Image(viewModel.imageSuccessIconName)
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
