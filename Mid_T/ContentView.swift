//
//  ContentView.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var companyVM = CompanyVM()
    @ObservedObject var launchVM = LaunchesVM()
    
    var body: some View {
        NavigationView {
            VStack() {
                Text(companyVM.companyInfoTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.title)
                    .padding()
                Text(companyVM.companyInfo)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.body)
                Spacer()
                Text(launchVM.launchesInfoTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.title)
                    .padding()
                List(launchVM.launches) { launch in
//                    let _ = print(launch)
                    LaunchCell(viewModel: LaunchVM(launch: launch))
                }
            }
            .navigationTitle("SpaceX")
            
            .toolbar {
                Button("Filter") {
                    // TODO: Open Filter
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
