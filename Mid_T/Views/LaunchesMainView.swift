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
    private let pickerText = "Please choose a year"
    private let order = ["All", "Success", "Failure"]
    
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
