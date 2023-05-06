//
//  ExpertVIewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 06/05/23.
//

import Foundation

class ExpertViewModel : ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isError: Bool = false
    @Published var experts : [ExpertAPIModel] = [ExpertAPIModel]()
    
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
            return
        }
        
        service.fetch([ExpertAPIModel].self, request: request!) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let experts):
                    print("--- sucess with \(experts.count)")
                    var gottenExpert : ExpertAPIModel;
                    for exp in experts {
                        gottenExpert = exp;
                        
                        //
                    }
                }
            }
        }
    }
    
    
}
