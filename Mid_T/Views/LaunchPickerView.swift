//
//  LaunchPickerView.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 30.12.21..
//

import SwiftUI

struct LaunchPickerView: View {
    
    // MARK: - API
    @Binding var selectedCase: String
    var order: [String]
    
    // MARK: - Properties
    private let pickerText = "Please choose a year"
    
    var body: some View {
        VStack {
            Picker(pickerText, selection: $selectedCase) { ForEach(order, id: \.self) { Text($0) } }
            .pickerStyle(.segmented)
            .padding()
        }
    }
}
