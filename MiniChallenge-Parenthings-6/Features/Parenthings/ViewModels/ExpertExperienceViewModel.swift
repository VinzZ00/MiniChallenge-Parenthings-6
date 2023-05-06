//
//  ExpertExperienceViewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 06/05/23.
//

import Foundation

class ExpertExperienceViewModel : ObservableObject {
    @Published var isLoading = false;
    @Published var isError = false;
    @Published var errorMessage : String? = nil;
    @Published var Experiences : [ExpertExperienceAPIModel] = []
    
    var service : APIService = APIService(isLogActive: true)
    
    
    func getExpertExperience(id : String) {
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
        
        service.fetch([ExpertExperienceAPIModel].self, request: request!) { [unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false;
                
                switch result {
                case .failure(let error) :
                    self.errorMessage = error.localizedDescription
                    
                case .success(let Experiences) :
                    print("success retrieving \(Experiences.count) rows")
                    self.Experiences = Experiences;
                    
                    self.Experiences = self.Experiences.filter{
                        $0.id == id;
                    }
                }
                
            }
        }
    }
}
