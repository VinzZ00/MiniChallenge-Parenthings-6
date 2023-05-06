//
//  ExpertEducationViewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 06/05/23.
//

import Foundation

class ExpertEducationViewModel : ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isError: Bool = false
    @Published var Educations : [ExpertEducationAPIModel] = []
    
    let service : APIService = APIService(isLogActive: true)
    
    
    
    func getExpertEducations(id : String) {
        isLoading = true
        errorMessage = nil
        isError = false
        
        let urlEndPoint: String = "expert_educations/\(id)"
        let fullUrl = URL(string: (ProcessInfo.processInfo.environment["BASE_URL"] ?? "")  + urlEndPoint)
        var request: URLRequest? = URLRequest(url: fullUrl!)
        request?.httpMethod = APIMethod.GET.description
        
        if request == nil {
            print(APIError.badURL)
        }
        
        service.fetch([ExpertEducationAPIModel].self, request: request!) { [unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false;
                
                switch result {
                case .failure(let error) :
                    self.errorMessage = error.localizedDescription
                    
                case .success(let experEducations) :
                    print("success retrieving \(experEducations.count) rows")
                    self.Educations = experEducations;
            }
                
            }
            
        }
        
        
    }
}

