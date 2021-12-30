//
//  FilterView.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 30.12.21..
//

import SwiftUI

struct FilterViewTitle: View {

    let title: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
        }
        .padding()
    }
}

struct FilterView: View {
    
    @ObservedObject var launchesVM: LaunchesVM
    @Environment(\.presentationMode) var presentationMode
    
    @State var selectedYear = "None"
    @State var selectedSuccessCase = "All"
    @State var selectedOrderCase = "ASC"
    
    private let filterTitle = "Choose Filter Options"
    private let launchOutcome = "Choose a launch outcome"
    private let orederingByYear = "Select ordering by year"
    private let successfulState = "Success"
    private let failureStateText = "Failure"
    private let successOptions = ["All", "Success", "Failure"]
    private let ascendingOptions = ["ASC", "DESC"]

    var body: some View {
        
        VStack {
            Text(filterTitle)
                .font(.title)
                .padding()
            YearPickerView(selectedYear: $selectedYear, years: [selectedYear] + launchesVM.launchesByYear)
            FilterViewTitle(title: launchOutcome)
            LaunchPickerView(selectedCase: $selectedSuccessCase, order: successOptions)
            FilterViewTitle(title: orederingByYear)
            LaunchPickerView(selectedCase: $selectedOrderCase, order: ascendingOptions)
            Spacer()
            VStack {
                Button {
                    launchesVM.resetFilters()
                    
                    let filter = LaunchesFilterObject(
                        year: selectedYear,
                        order: selectedOrderCase,
                        successfulState: selectedSuccessCase,
                        successfulStateText: successfulState,
                        failureStateText: failureStateText
                    )
                    
                    launchesVM.filter(filterObject: filter)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text(LaunchesVM.applyFiltersText)
                }
                Button {
                    launchesVM.resetFilters()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text(LaunchesVM.resetFiltersText)
                }.padding()
            }
        }
    }
}
