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
    @Published var experts : [Expert] = [Expert]()
    
    let service : APIService = APIService(isLogActive: true)
    
    
    
    
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
        
        service.fetch([ExpertAPIModel].self, request: request!) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let retrievedExperts):
                    print("--- sucess with \(retrievedExperts.count)")
                    var edus = ExpertEducationViewModel()
                    var exps = ExpertExperienceViewModel()
                    
                    edus.getExpertEducations()
                    
                    exps.getExpertExperience()
                    
                    var gottenExpert : ExpertAPIModel;
                    
                    for exp in retrievedExperts {
                        gottenExpert = exp;
                        
                    var lastEducation : ExpertEducationAPIModel? =
                        edus.Educations.filter{
                            $0.expert_id == exp.id
                        }.last ?? nil
                        
//                        if edus.Educations.count != 0 {
//                            lastEducation = edus.Educations.last!
//                        }
                        
//                        exps.getExpertExperience(id: gottenExpert.id)
                        
                    var lastExperience : ExpertExperienceAPIModel? =
                        exps.Experiences.filter{
                            $0.expert_id == exp.id
                        }.last ?? nil
                        
//                        if exps.Experiences.count != 0 {
//                            lastExperience = exps.Experiences.last!
//                        }
                        
                        var expertImage : UIImage? = nil;
                        
                        let url = URL(string: gottenExpert.photo_url)
                        
                        if let data = try? Data(contentsOf: url!)
                        {
                            expertImage = UIImage(data: data) ?? UIImage(systemName: "person.fill")!
                        }
                        
                        var readyToUseExpert : Expert =
                        Expert(
                            name: gottenExpert.name,
                            education: lastEducation?.name ?? "unknown",
                            educationDesc: "",
                            expDesc: "",
                            imageBase64: expertImage?.toBase64() ?? "",
                            isAvailable: true
                            )
                        
                        self.experts.append(readyToUseExpert)
                        print("Expert with id \(readyToUseExpert.id) is inserted")
                    }
                }
            }
        }
        
    }
}
