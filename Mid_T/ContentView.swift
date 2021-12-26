//
//  ContentView.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 23.12.21..
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var companyVM = CompanyVM()
    @ObservedObject var launchVM = LaunchesVM()
    
    var body: some View {
        NavigationView {
            VStack() {
                Text("COMPANY")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.title)
                    .padding()
                Text(companyVM.companyInfo)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Spacer()
                Text("LAUNCHES")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.title)
                    .padding()
                List(launchVM.launches) { launch in
                    LaunchCell(viewModel: LaunchVM(launch: launch))
                }
            }
            .navigationTitle("SpaceX")
            
            .toolbar {
                Button("Filter") {
                    
                    var store = Set<AnyCancellable>()
                    companyVM.fetchCompanyDataCombine().sink { (company) in
                        
                        
                    }
                    .store(in: &store)
                    
                    
                    companyVM.fetchCompanyData()
                    launchVM.fetchLaunches()
                    print("Help tapped!")
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
