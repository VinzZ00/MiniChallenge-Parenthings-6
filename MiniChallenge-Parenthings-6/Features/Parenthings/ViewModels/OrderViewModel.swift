//
//  OrderViewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 08/05/23.
//

import Foundation

import SwiftUI

class OrderViewModel : ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isError: Bool = false
    var experts : [Expert] = [Expert]()
    
    @Published var edus = ExpertEducationViewModel()
    @Published var exps = ExpertExperienceViewModel()
    
    
    let service : APIService = APIService(isLogActive: true)
    
    
    
    init() {
    }
  
    
    func getAllOrder(user_id: String) {
        isLoading = true
        errorMessage = nil
        isError = false
        
        
        let urlEndPoint: String = "users/\(user_id)/orders"
        let fullUrl = URL(string: (ProcessInfo.processInfo.environment["BASE_URL"] ?? "")  + urlEndPoint)
        var request: URLRequest? = URLRequest(url: fullUrl!)
        
        request?.httpMethod = APIMethod.GET.description;
        
        if request == nil {
            let error = APIError.badURL
            print(error)
            return;
        }
        
        service.fetch([OrderApiModel].self, request: request!) { [self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let retrievedExperts):
                    print("--- sucess with \(retrievedExperts.count)")
                  
                }
            }
        }
        
    }
}
