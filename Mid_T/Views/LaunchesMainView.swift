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
        LoadingView(isShowing: $launchesVM.isLoading) {
            NavigationView {
                VStack() {
                    LaunchesMainViewText(text: companyVM.companyInfoTitle, font: .title)
                    LaunchesMainViewText(text: companyVM.companyInfo, font: .body)
                    Spacer()
                    LaunchesMainViewText(text: launchesVM.launchesInfoTitle, font: .title)
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
}

struct LaunchesMainViewText: View {
    
    let text: String
    var font: Font
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(font)
            .padding()
    }
}


