
import Chat
import Foundation
import Combine

final class ChatInteractor: ChatInteractorProtocol {
    private var chatData : ChatData

    private lazy var chatState = CurrentValueSubject<[Message], Never>(generateStartMessages())
    private lazy var sharedState = chatState.share()

    private let isActive: Bool
    private var isLoading = false
    private var lastDate = Date()

    private var subscriptions = Set<AnyCancellable>()

    var messages: AnyPublisher<[Message], Never> {
        sharedState.eraseToAnyPublisher()
    }
    
    var senders: [Chat.User] {
        var Users = [chatData.otherSender, chatData.currentUser]
        return Users
    }
    
    var otherSenders: [Chat.User] {
        senders.filter { !$0.isCurrentUser }
    }
    
    
    init(isActive: Bool = false, chatData : ChatData) {
        self.isActive = isActive // kegunaan Debug kemarin
        self.chatData = chatData
    }

    /// TODO: Generate error with random chance
    /// TODO: Save images from url to files. Imitate upload process
    func send(message: CreateMessage) {
        if message.uid != nil {
            guard let index = chatState.value.firstIndex(where: { $0.id == message.uid }) else {
                // TODO: Create error
                return
            }
            chatState.value.remove(at: index)
        }
        let message = message.toMessage(user: chatData.currentUser, status: Chat.Message.Status.sending)
        chatState.value.append(message)
    }

    func connect() {
        Timer.publish(every: 2, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateSendingStatuses()
            }
            .store(in: &subscriptions)
    }

    func disconnect() {
        subscriptions.removeAll()
    }

    func loadNextPage() -> Future<Bool, Never> {
        Future<Bool, Never> { [weak self] promise in
            guard let self = self, !self.isLoading else {
                promise(.success(false))
                return
            }
            self.isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
                guard let self = self else { return }
                let messages = self.generateStartMessages()
                self.chatState.value = messages + self.chatState.value
                self.isLoading = false
                promise(.success(true))
            }
        }
    }
}

private extension ChatInteractor {
    func generateStartMessages() -> [Message] {
        return chatData.chatData
            .sorted { lhs, rhs in
                lhs.createdAt < rhs.createdAt
            }
    }
//
//    func generateNewMessage(userName : String, chatMessage : ) {
//        let message = chatData.randomMessage(senders: otherSenders)
//        chatState.value.append(message)
//    }
//
    func updateSendingStatuses() {
        let updated = chatState.value.map {
            var message = $0
            if message.status == .sending {
//                if Int.random(min: 0, max: 2) == 0 {
//                    message.status = .error
//                } else {
//                    message.status = .sent
//                }
                
//                pake tryCatch block, ke databaseRainer, jdi disini kita bakal simpen sii, disini panggil API
                
            } else if message.status == .sent {
                message.status = .read
            }
            return message
        }
        chatState.value = updated
    }
}
