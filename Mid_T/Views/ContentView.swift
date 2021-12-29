//
//  ContentView.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import SwiftUI

struct LaunchesMainView: View {
    
    @State private var showModal: Bool = false
    @ObservedObject var companyVM = CompanyVM()
    @ObservedObject var launchesVM = LaunchesVM()
    
    private let companyTitle = "SpaceX"
    private let filterTitle = "Filter"
    
    var body: some View {
        NavigationView {
            VStack() {
                Text(companyVM.companyInfoTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.title)
                    .padding()
                Text(companyVM.companyInfo)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                    .padding()
                Spacer()
                Text(launchesVM.launchesInfoTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.title)
                    .padding()
                List(launchesVM.launches) { launch in
                    LaunchCell(viewModel: LaunchVM(launch: launch))
                }
            }
            .navigationTitle(companyTitle)
            .toolbar {
                Button(filterTitle) {
                    self.showModal = true
                }.sheet(isPresented: self.$showModal) {
                } content: {
                    FilterView(launchesVM: launchesVM)
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
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

    var body: some View {
        
        VStack {
            Text(filterTitle)
                .font(.title)
                .padding()
            YearPickerView(selectedYear: $selectedYear, years: [selectedYear] + launchesVM.launchesByYear)
            HStack {
                Text(launchOutcome)
                Spacer()
            }
            .padding()
            LaunchSuccessView(selectedSuccessCase: $selectedSuccessCase)
            HStack {
                Text(orederingByYear)
                Spacer()
            }
            .padding()
            LaunchOrderView(selectedOrderCase: $selectedOrderCase)
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

struct LaunchSuccessView: View {
    
    // MARK: - API
    @Binding var selectedSuccessCase: String
    
    // MARK: - Properties
    private let order = ["All", "Success", "Failure"]
    private let pickerText = "Please choose a year"
    
    var body: some View {
        VStack {
            Picker(pickerText, selection: $selectedSuccessCase) { ForEach(order, id: \.self) { Text($0) } }
            .pickerStyle(.segmented)
            .padding()
        }
    }
}

struct LaunchOrderView: View {
    
    // MARK: - API
    @Binding var selectedOrderCase: String
    
    // MARK: - Properties
    private let pickerText = "Please choose a year"
    private let order = ["ASC", "DESC"]
    
    var body: some View {
        VStack {
            Picker(pickerText, selection: $selectedOrderCase) { ForEach(order, id: \.self) { Text($0) } }
            .pickerStyle(.segmented)
            .padding()
        }
    }
}
