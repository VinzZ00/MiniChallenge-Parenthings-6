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
    @Published var userViewModel : UserViewModel = UserViewModel();
    @Published var messagesCurrentUser : [Chat.Message] = []
    @Published var messageExpert : [Chat.Message] = []
    
    var expertViewModel : ExpertViewModel = ExpertViewModel();
    
    let service : APIService = APIService(isLogActive: true);
    
    init(currentUser : User, expert : Expert) {
        getChatData(currentUser: currentUser, expert: expert)
    }
    
    func getChatData(currentUser : User, expert : Expert) {
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
                
                
                let chatItemAPIModel = ChatItemAPIModel.filter{
                    $0.expert_id == expert.id?.uuidString && $0.user_id == currentUser.id?.uuidString
                }
                
                chatItemAPIModel.map{
                    if $0.expert_id == expert.id!.uuidString {
                        self.messageExpert.append(Message(id: $0.id, user: Chat.User(id: expert.id!.uuidString, name: expert.name, avatarURL: URL(string: expert.imageBase64), isCurrentUser: false), createdAt: Date(), text: $0.message))
                    } else if $0.user_id == currentUser.id!.uuidString {
                        self.messagesCurrentUser.append(Message(id: $0.id, user: Chat.User(id: currentUser.id!.uuidString, name: currentUser.name, avatarURL: nil , isCurrentUser: true)))
                    }
                }
            }
            
        }
    }
    
}
