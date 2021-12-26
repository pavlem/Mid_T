//
//  LaunchDetail.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 26.12.21..
//

import SwiftUI

struct LaunchDetail: View {
    private (set) var viewModel: LaunchVM
    
    var body: some View {
        Text(viewModel.missionInfo)
    }
}
