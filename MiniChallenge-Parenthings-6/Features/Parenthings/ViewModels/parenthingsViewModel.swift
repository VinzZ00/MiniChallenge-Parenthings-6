//
//  parenthingsViewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 22/04/23.
//

import Foundation
import SwiftUI
import Combine
import Chat

class parenthingsViewModel : ObservableObject {
    @Published var expertDetailIsPresented : Bool = false;
    @Published var selectedExpert : Expert?
    @Published var textFieldIsClicked = false;
    @Published var searchExpertBarValue : String = "";
    
    @Published var consultationDetailIsPresented : Bool = false;
    @Published var selectedConsultation : ConsultationTransaction?
    
    
    @Published var user : User? = User(name: "Elvin", balanceParenting: 20000); //in Production ini tidak diisi disini tp, dari sign in page.
    @Published var experts : ExpertRepository = ExpertRepository();
    
    @Published var navBarShown : Bool = true;
    @Published var transactions : TransactionRepository = TransactionRepository();
    
    @Published var selectedPayment : TypePayment = .Parenthing
    
    @Published var startConsulting : Bool = false;
    @Published var remainingTime : Int  = 0;
    //    @Published var CurrenttimeRemaining?;
    //    @Published var buttonClicked : Bool = false;
    
    @Published var choosePayment : Bool =  false;
    
    
    var paymentDetail : (Image, String, Double) {
        switch self.selectedPayment {
        case .Parenthing  :
            return (Image("LogoParenthing"), "Parenthing", selectedConsultation?.totalPrice ?? 0)
            
        case .GoPay:
            return (Image(""), "Gopay", selectedConsultation?.totalPrice ?? 0)

        case .Ovo:
            return (Image(""), "Ovo", selectedConsultation?.totalPrice ?? 0)

        case .Dana:
            return (Image(""), "Dana", selectedConsultation?.totalPrice ?? 0)

        case .BankTransfer:
            return (Image(""), "Bank Transfer", selectedConsultation?.totalPrice ?? 0)

        }
    }
    
    
    func getUniqueTransactionDate() -> Set<Date>{
//        var DatesUnUnique : [Date] = transactions.savedTransaction[0].TransactionDate
//        if !transactions.savedTransaction.isEmpty {
//            DatesUnUnique.insert(transactions.savedTransaction[0].TransactionDate)
//        }
        let calendar = Calendar.current
        
        var uniqueDates = Set<Date>()
        
        for trx in transactions.savedTransaction {
            let uniqueDate = calendar.startOfDay(for: trx.TransactionDate)
               uniqueDates.insert(uniqueDate)
        }
        
        return Set(uniqueDates);
    }
    
//    var name : String = ""
//    var role : String = ""
//    var longExp : Int = 0
//    var Price : Double = 0.00
//    var StarCount : Double = 0.00
//    var imageBase64 : encodedBase64 = ""
    
    
    // Field apa aja??
    
//    var expertImage : Image? {
//        let uiImage = imageBase64.toUIImage()
//
//        if let image = uiImage {
//            return Image(uiImage: image)
//        } else {
//            return nil
//        }
//    }
    
    @Published var messages: [Message] = []
    
    var chatTitle: String {
        interactor.otherSenders.count == 1 ? interactor.otherSenders.first!.name : "Group chat"
    }
    var chatStatus: String {
        interactor.otherSenders.count == 1 ? "online" : "\(interactor.senders.count) members"
    }
    var chatCover: URL? {
        interactor.otherSenders.count == 1 ? interactor.otherSenders.first!.avatarURL : nil
    }

    private let interactor: ChatInteractorProtocol
    private var subscriptions = Set<AnyCancellable>()

    init(interactor: ChatInteractorProtocol = ChatInteractor()) {
        self.interactor = interactor
    }

    func send(draft: DraftMessage) {
        interactor.send(message: draft.toCreateMessage())
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

struct CreateMessage {
    let uid: String?
    let createdAt: Date

    let text: String
//    let images: [ImageAttachment]
//    let recording: Recording?
//    let replyMessage: ReplyMessage?
}


extension CreateMessage {
    func toMessage(user: Chat.User, status: Chat.Message.Status = .read) -> Message {
        Message(
            id: UUID().uuidString,
            user: user.toChatUser(),
            status: user.isCurrentUser ? status : nil,
            createdAt:createdAt,
            text: text
//            images: images,
//            recording: recording,
//            replyMessage: replyMessage
        )
    }
}

extension DraftMessage {
//    func makeMockImages() -> [MockImage] {
//        attachments
//            .compactMap { $0 as? ImageAttachment }
//            .map {
//                MockImage(thumbnail: $0.thumbnail, full: $0.full)
//            }
//    }

    func toCreateMessage() -> CreateMessage {
        CreateMessage(
            uid: id,
            createdAt: createdAt,
            text: text
//            images: makeMockImages(),
//            recording: recording,
//            replyMessage: replyMessage
        )
    }
}
