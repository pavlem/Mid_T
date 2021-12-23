//
//  LaunchCell.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import SwiftUI

struct LaunchCell: View {
    let launch: Launch
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            HStack {
                Text("Mission: ")
                    .font(.headline)
                Text("\(launch.missionName)")
            }
            Text("Date/time:")
            Text("Rocket: \(launch.rocket.rocketName)/\(launch.rocket.rocketType)")
                .font(.caption)
            Text("Days:")
                .font(.caption)
        })
    }
}
