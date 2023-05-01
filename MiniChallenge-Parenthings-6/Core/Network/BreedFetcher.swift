//
//  BreedFetcher.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 02/05/23.
//

import Foundation

class BreedFetcher: ObservableObject {
    
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIService
    
    init(service: APIService = APIService(isLogActive: true)) {
        self.service = service
        fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
        
        isLoading = true
        errorMessage = nil
        
//        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        
        
        //DON'T FORGET INSERT BASE_URL inside ENV
        var urlEndPoint: String = "breeds"
        let fullUrl = URL(string: (ProcessInfo.processInfo.environment["BASE_URL"] ?? "")  + urlEndPoint)
        var request: URLRequest? = URLRequest(url: fullUrl!)
        
        // Method Api
        request?.httpMethod = APIMethod.GET.description

        if request == nil {
            let error = APIError.badURL
            print(error)
            return
        }
        
        
        //if Api doesn't Requeired Body/Header don't put it there
//        let json: [String: Any] = ["": ""]
//        let bodyData = try? JSONSerialization.data(withJSONObject: json)
//        if(request?.httpMethod != APIMethod.GET.description){
//            request?.httpBody = bodyData
//        }
//        var headers: [String: String] = ["":""]
//        if(!headers.isEmpty){
//            request?.allHTTPHeaderFields = headers
//        }
        
        service.fetch([Breed].self, request: request!) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let breeds):
                    print("--- sucess with \(breeds.count)")
                    self.breeds = breeds
                }
            }
        }
        
    }
    
    
    //MARK: preview helpers
    
    static func errorState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.breeds = [Breed.example1(), Breed.example2()]
        
        return fetcher
    }
}
