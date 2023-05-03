import Foundation
import Combine
import Chat

protocol ChatInteractorProtocol {
    var messages: AnyPublisher<[Message], Never> { get }
    var senders: [Chat.User] { get }
    var otherSenders: [Chat.User] { get }

    func send(message: CreateMessage)

    func connect()
    func disconnect()

    func loadNextPage() -> Future<Bool, Never>
}
