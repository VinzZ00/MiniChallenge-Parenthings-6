//
//  ExpertVIewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 06/05/23.
//

import Foundation
import SwiftUI

class ExpertViewModel : ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isError: Bool = false
    var experts : [Expert] = [Expert]()
    
    @Published var edus = ExpertEducationViewModel()
    @Published var exps = ExpertExperienceViewModel()
    
    
    let service : APIService = APIService(isLogActive: true)
    
    
    
    init() {
        getAllExpert()
    }
    
    
    func getAllExpert() {
        isLoading = true
        errorMessage = nil
        isError = false
        
        
        let urlEndPoint: String = "experts"
        let fullUrl = URL(string: (ProcessInfo.processInfo.environment["BASE_URL"] ?? "")  + urlEndPoint)
        var request: URLRequest? = URLRequest(url: fullUrl!)
        
        request?.httpMethod = APIMethod.GET.description;
        
        if request == nil {
            let error = APIError.badURL
            print(error)
            return;
        }
        
        service.fetch([ExpertAPIModel].self, request: request!) { [self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let retrievedExperts):
                    print("--- sucess with \(retrievedExperts.count)")
                    
                    var gottenExpert : ExpertAPIModel;
                    
                    var educations : [ExpertEducationAPIModel] {
                        print("In the expert View Model Edus " ,self.edus.Educations.count, "ROws")
                        return self.edus.Educations
                    }
                    
                    var experiences : [ExpertExperienceAPIModel] {
                        print("In the expert View Model Exper " ,self.exps.Experiences.count, "ROws")
                        return self.exps.Experiences
                    }
                    
                    for exp in retrievedExperts {
                        gottenExpert = exp;
                     
                        
                        
                        let lastEducation : ExpertEducationAPIModel? =
                        educations.filter{
                            $0.expert_id == exp.id
                        }.last ?? nil


                        let lastExperience : ExpertExperienceAPIModel? =
                        experiences.filter{
                            $0.expert_id == exp.id
                        }.last ?? nil
                        
                        let calendar = Calendar.current
                        let currentYear = calendar.component(.year, from: Date());
                        
                        let readyToUseExpert : Expert =
                        Expert(
                            id : UUID(uuidString : gottenExpert.id) ?? nil,
                            name: gottenExpert.name,
                            role : lastEducation?.name ?? "UNknown",
                            education: lastEducation?.name ?? "unknown",
                            educationDesc: lastEducation?.name ?? "Unknown",
                            longExp: currentYear - gottenExpert.year_of_experience,
                            expDesc: (lastExperience)?.name ?? "No description",
                            price: gottenExpert.price,
                            starCount: 5,
                            imageBase64: gottenExpert.photo_url,
                            isAvailable: true
                            )
                        
                        self.experts.append(readyToUseExpert)
                        print("Expert with id \(readyToUseExpert.id) is inserted \(gottenExpert.photo_url)")
                        
                    }
                }
            }
        }
        
    }
}
