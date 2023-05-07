//
//  ChatVIewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 07/05/23.
//

import Foundation
import Chat

class ChatViewModel : ObservableObject
{
    @Published var isLoading: Bool = false
    @Published var isSigninSuccess: Bool = false
    @Published var isSignupSuccess: Bool = false
    
    @Published var errorMessage : String = ""
    @Published var isError : Bool = false;
        
    @Published var ChatItem : [ChatItemAPIModel] = []
    
    @Published var messagesCurrentUser : [Chat.Message] = []
    @Published var messageExpert : [Chat.Message] = []
    
    let service : APIService = APIService(isLogActive: true);
    
    init(firstUserId : String, secondUserId : String) {
        getChatData(currentUserID: firstUserId, expertUserId: secondUserId)
    }
    
    func getChatData(currentUserID : String, expertUserId : String) {
        isLoading = true;
        
        errorMessage = "";
        isError = false
        
        
        let urlEndPoint: String = "chat_items"
        let fullUrl = URL(string: (ProcessInfo.processInfo.environment["BASE_URL"] ?? "")  + urlEndPoint)
        var request: URLRequest? = URLRequest(url: fullUrl!)
        
        request?.httpMethod = APIMethod.GET.description;
        
        if request == nil {
            let error = APIError.badURL
            print(error)
            return;
        }
        
        service.fetch([ChatItemAPIModel].self, request: request!) { [self] result in
        
    
            isLoading = false;
            switch result {
            case .failure(let error) :
                self.isError = true
                self.errorMessage = error.description
            case .success(let ChatItemAPIModel):
                ChatItemAPIModel.map {
                    
                }
            }
            
        }
    }
    
}
