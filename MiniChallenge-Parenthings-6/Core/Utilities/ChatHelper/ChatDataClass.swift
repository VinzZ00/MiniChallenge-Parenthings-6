//
//  ChatData.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 03/05/23.
//

import Foundation
import Chat
import SwiftUI

final class ChatData{
    
    let chatData : [Chat.Message];
    
    let currentUsername : String
    let currentUserProfileImage : String = UIImage(systemName: "person.fill")!.toBase64()!; // nnt ganti dari String to UIImage kemudian to base 64, karena chatnya simpen URL, kalo base64 di buka di web bisa seharusny
    
    let expertName : String
    let CurrentExpertProfileImage : String = UIImage(systemName: "person.fill")!.toBase64()!;
    
    init(currentUsername: String, expertName: String, allChatData : [Chat.Message]) {
        self.currentUsername = currentUsername
        self.expertName = expertName
        self.chatData = allChatData.filter{
            $0.user.name == currentUsername || $0.user.name == expertName
        }
    }
    
    
    //    let systemprofileImage : String = UIImage(systemName: "gear.fill")!.toBase64()!
    
    
    let system : Chat.User = Chat.User(id: "0", name: "system", avatarURL: URL(string: UIImage(systemName: "person.fill")!.toBase64()!), isCurrentUser: false )
    
    var currentUser : Chat.User {
        Chat.User(id: "1", name: self.currentUsername, avatarURL:URL(string:  self.currentUserProfileImage), isCurrentUser: true)
    }
    
    var otherSender : Chat.User {
        Chat.User(id : "2", name: self.CurrentExpertProfileImage, avatarURL: URL(string: self.CurrentExpertProfileImage), isCurrentUser: false)
    }
    
    
    
}
