//
//  ContentViewModel.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation


class ContentViewModel : ObservableObject {
    
    private let apiService = ApiService()
    @Published var navigateDetail: DeviceData? = nil
    @Published var data: [DeviceData]? = []
    
    init() {
        fetchAPI()
    }

    func fetchAPI() {
        apiService.fetchDeviceDetails(completion: { item in
            DispatchQueue.main.async {
                self.data = item
            }
        })
    }
    
    func navigateToDetail(navigateDetail: DeviceData) {
        self.navigateDetail = navigateDetail
    }
}
