//
//  LaunchDetail.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 26.12.21..
//

import SwiftUI

struct LaunchDetailVM {
    let missionInfo: String
}

extension LaunchDetailVM {
    init(launchVM: LaunchVM) {
        self.missionInfo = launchVM.missionInfo
    }
}

struct LaunchDetail: View {
    
    
    private (set) var viewModel: LaunchDetailVM
    
    var body: some View {
        Text(viewModel.missionInfo)
    }
}
