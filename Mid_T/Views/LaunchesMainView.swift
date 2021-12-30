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




