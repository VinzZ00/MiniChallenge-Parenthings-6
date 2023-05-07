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
    @Published var Educations : [ExpertEducationAPIModel] = [ExpertEducationAPIModel]()
    
    let service : APIService = APIService(isLogActive: true)
    
    
    
    func getExpertEducations() {
        isLoading = true
        errorMessage = nil
        isError = false
        
        let urlEndPoint: String = "expert_educations"
        let fullUrl = URL(string: (ProcessInfo.processInfo.environment["BASE_URL"] ?? "")  + urlEndPoint)
        var request: URLRequest? = URLRequest(url: fullUrl!)
        request?.httpMethod = APIMethod.GET.description
        
        if request == nil {
            print(APIError.badURL)
            return
        }
        
        service.fetch([ExpertEducationAPIModel].self, request: request!) { [self] result in
            
            DispatchQueue.main.async {
                
//                self.isLoading = false;
                
                switch result {
                case .failure(let error) :
                    print("Fail retrieving educations")
                    self.errorMessage = error.localizedDescription
                case .success(let expertEducations) :
                    print("success retrieving \(expertEducations.count) rows")
//
//                    for education in expertEducations {
//                        if education.expert_id == id {
//                            self.Educations.append(education)
//                        }
//                    }
                   
                    self.Educations = expertEducations
                    print("Done Retrieving")
                }
            }
        }
    }
}

