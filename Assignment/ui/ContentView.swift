//
//  ContentView.swift
//  Assignment
//
//  Created by Kunal on 03/01/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ContentViewModel()
    @State private var path: [DeviceData] = [] // Navigation path
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if let computers = searchResults, !computers.isEmpty {
                    DevicesList(devices: computers) { selectedComputer in
                        viewModel.navigateToDetail(navigateDetail: selectedComputer)
                    }
                } else if !searchText.isEmpty && (searchResults?.isEmpty ?? false) {
                    Text("No results found")
                }  else {
                    ProgressView("Loading...")
                }
            }
            .onChange(of: viewModel.navigateDetail, {
                let navigate = viewModel.navigateDetail
                path.append(navigate!)
            })
            .navigationTitle("Devices")
            .navigationDestination(for: DeviceData.self) { computer in
                DetailView(device: computer)
            }
            
        }
        .searchable(text: $searchText) {
            ForEach(searchResults ?? []) { result in
                Text(result.name).searchCompletion(result.name)
            }
        }
    }
    var searchResults: [DeviceData]? {
        if searchText.isEmpty {
            return viewModel.data
            
        } else {
            return viewModel.data?.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}



