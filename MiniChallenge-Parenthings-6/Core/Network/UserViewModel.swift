//
//  UserFetcher.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation
class UserViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var isSigninSuccess: Bool = false
    @Published var isSignupSuccess: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isError: Bool = false
    
    let service: APIService
    
    init(service: APIService = APIService(isLogActive: true)) {
        self.service = service
    }
    
    func doSignin(phone: String) {
        
        isLoading = true
        errorMessage = nil
        isError = false

                
        //DON'T FORGET INSERT BASE_URL inside ENV
        let urlEndPoint: String = "users/phone/\(phone)"
        let fullUrl = URL(string: (ProcessInfo.processInfo.environment["BASE_URL"] ?? "")  + urlEndPoint)
        var request: URLRequest? = URLRequest(url: fullUrl!)
        
        // Method Api
        request?.httpMethod = APIMethod.GET.description

        if request == nil {
            let error = APIError.badURL
            print(error)
            return
        }
   
        service.fetch(UserApiModel.self, request: request!) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.description
                    // print(error.description)
                    print(error)
                    isError = true
                case .success(let response):
                    print("success: \(response.id)")
//                    print("--- sucess with \(breeds.count)")
//                    self.breeds = breeds
                    self.isSigninSuccess = true
                }
            }
        }
    }
    
    
    func doSignup(phone: String, name: String) {
        
        isLoading = true
        errorMessage = nil
        
//        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        
        
        //DON'T FORGET INSERT BASE_URL inside ENV
        let urlEndPoint: String = "users"
        let fullUrl = URL(string: (ProcessInfo.processInfo.environment["BASE_URL"] ?? "")  + urlEndPoint)
        var request: URLRequest? = URLRequest(url: fullUrl!)
        
        // Method Api
        request?.httpMethod = APIMethod.POST.description

        if request == nil {
            let error = APIError.badURL
            print(error)
            return
        }
        
        
        //if Api doesn't Requeired Body/Header don't put it there
        let jsonData: [String: Any] = ["name": name,"phone": phone]
        let bodyData = jsonData.percentEncoded()
        
        request?.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request?.setValue("application/json", forHTTPHeaderField: "Accept")
        request?.httpBody = bodyData
        
//        var headers: [String: String] = ["":""]
//        if(!headers.isEmpty){
//            request?.allHTTPHeaderFields = headers
//        }
        
        service.fetch(UserApiModel.self, request: request!) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(_):
                    print("success")
//                    print("--- sucess with \(breeds.count)")
//                    self.breeds = breeds
                    self.isSignupSuccess = true
                }
            }
        }
        
    }
    
}
