//
//  YearPickerView.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 30.12.21..
//

import SwiftUI

struct YearPickerView: View {

    // MARK: - API
    @Binding var selectedYear: String
    var years: [String]
    
    // MARK: - Properties
    private let selectAYearText = "Select a year: "
    private let chooseAYearText = "Please choose a year"
    
    var body: some View {
        HStack {
            Text(selectAYearText)
            Spacer()
            Picker(chooseAYearText, selection: $selectedYear) {
                ForEach(years, id: \.self) {
                    Text($0)
                }
            }
        }
        .padding()
    }
}
