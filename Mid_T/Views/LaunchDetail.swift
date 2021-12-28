//
//  LaunchDetail.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 28.12.21..
//

import SwiftUI

struct LaunchDetail: View {
    
    private (set) var viewModel: LaunchDetailVM
    
    private let imageFrameWidth = CGFloat(200)
    private let imageFrameHeight = CGFloat(200)
    private let shadowRadius = CGFloat(10)
    private let lineWidth = CGFloat(12)

    var body: some View {
        VStack {
            CachedAsyncImage(url: URL(string: viewModel.missionImageUrl))
                .frame(width: imageFrameWidth, height: imageFrameHeight)
                .cornerRadius(imageFrameHeight / 2)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(viewModel.strokeColor, lineWidth: lineWidth)
                )
                .shadow(radius: shadowRadius)
            Text(viewModel.missionInfo)
                .font(.title)
            Text(viewModel.rocketInfo)
                .font(.subheadline)
            Divider()
            Text(viewModel.description)
                .font(.headline)
                .multilineTextAlignment(viewModel.missionSuccess ? .center : .leading)
        }.padding().navigationBarTitle(Text(viewModel.missionInfo), displayMode: .inline)
    }
}
