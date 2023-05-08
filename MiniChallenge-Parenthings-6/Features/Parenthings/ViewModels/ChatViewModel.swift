//
//  ChatVIewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 07/05/23.
//

import Foundation
import Chat
import Combine
import SwiftUI

class ChatViewModel : ObservableObject
{
    @Published var isLoading: Bool = false
    @Published var isSigninSuccess: Bool = false
    @Published var isSignupSuccess: Bool = false
    
    @Published var currentUser : User? = nil
    @Published var expert : Expert? = nil
    
    @Published var errorMessage : String = ""
    @Published var isError : Bool = false;
    @Published var messages : [Chat.Message] = []
        
    @Published var ChatItem : [ChatItemAPIModel] = []
    @Published var userViewModel : UserViewModel = UserViewModel();
    @Published var messagesCurrentUser : [Chat.Message] = []
    @Published var messageExpert : [Chat.Message] = []
    @Published var allChatOnRegarding : [Chat.Message] = [];

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
                
                print("ChatItemAPIModel has \(ChatItemAPIModel) datas.")
                
                var chatItemAPIModel = ChatItemAPIModel.filter{
                    return  $0.expert_id == expert.id?.uuidString && $0.user_id == currentUser.id?.uuidString
                }
                
                print("chatItemAPIModel has mapped, \(chatItemAPIModel.count) datas.")
                for i in chatItemAPIModel.indices {
                    print("text : \(chatItemAPIModel[i].message)")
                    if(i < chatItemAPIModel.count - 3 || i < chatItemAPIModel.count - 2){
                        chatItemAPIModel[i].expert_id = ""
                    }
                    if(i < chatItemAPIModel.count - 3 || i < chatItemAPIModel.count - 2){
                        chatItemAPIModel[i].expert_id = ""
                    }
                }
                DispatchQueue.main.async {
                    
             var _ = chatItemAPIModel.map{
                        if $0.expert_id == expert.id!.uuidString {
                            self.messageExpert.append(Message(id: $0.id, user: Chat.User(id: expert.id!.uuidString, name: expert.name, avatarURL: URL(string: expert.imageBase64), isCurrentUser: true), createdAt: Date(), text: $0.message))
                            
                            print("CountChat : \(self.messageExpert.count)")
                        } else if $0.user_id == currentUser.id!.uuidString {
                            self.messagesCurrentUser.append(Message(id: $0.id, user: Chat.User(id: currentUser.id!.uuidString, name: currentUser.name, avatarURL: nil , isCurrentUser: false), createdAt: Date(), text: $0.message))
                            print("CountChat : \(self.messagesCurrentUser.count)")
                        }
                 
                 self.messages = self.messagesCurrentUser + self.messageExpert

                    }
                }
            }
            
        }
    }
    
    
    var chatTitle: String {
        interactor.otherSenders.count == 1 ? interactor.otherSenders.first!.name : "Group chat"
    }
    var chatStatus: String {
        interactor.otherSenders.count == 1 ? "online" : "\(interactor.senders.count) members"
    }
    var chatCover: URL? {
        interactor.otherSenders.count == 1 ? interactor.otherSenders.first!.avatarURL : nil
    }

    private var interactor: ChatInteractorProtocol {
        ChatInteractor(chatData: ChatData(currentUsername: currentUser?.name ?? "", expertName: expert?.name  ?? "", allChatData: self.messages))   
    }
    private var subscriptions = Set<AnyCancellable>()
    
    

    func send(draft: DraftMessage) {
        print("messages.count: \(messages.count)")
        print("draft :\(draft)")
        interactor.send(message: draft.toCreateMessage())
        
        messages.append(Message(id: draft.id ?? "", user: Chat.User(id: currentUser?.id?.uuidString ?? "", name: currentUser?.name ?? "", avatarURL: nil , isCurrentUser: true), createdAt: draft.createdAt ?? Date(), text: draft.text ?? ""))
        print("messages.count: \(messages.count)")
        
    }
    
    func onStart() {
        interactor.messages
            .compactMap { messages in
                messages.map { $0.toChatMessage() }
            }
            .assign(to: &$messages)

        interactor.connect()
    }

    func onStop() {
        interactor.disconnect()
    }

    func loadMoreMessage(before message: Message) {
        interactor.loadNextPage()
            .sink { _ in }
            .store(in: &subscriptions)
    }
    
}
