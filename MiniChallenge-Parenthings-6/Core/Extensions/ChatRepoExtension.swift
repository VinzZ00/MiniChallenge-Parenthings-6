//
//  ChatUserExtension.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 04/05/23.
//

import Foundation
import Chat

extension Chat.User {
    var isCurrentUser: Bool {
        id == "1"
    }
}

extension Chat.User {
    func toChatUser() -> Chat.User {
        Chat.User(id: id, name: name, avatarURL: avatarURL, isCurrentUser: isCurrentUser)
    }
}
extension Chat.Message {
    func toChatMessage() -> Chat.Message {
        Chat.Message(
            id: id,
            user: user.toChatUser(),
            status: status,
            createdAt: createdAt,
            text: text
//            attachments: images.map { $0.toChatAttachment() },
//            recording: recording,
//            replyMessage: replyMessage
        )
    }
}
