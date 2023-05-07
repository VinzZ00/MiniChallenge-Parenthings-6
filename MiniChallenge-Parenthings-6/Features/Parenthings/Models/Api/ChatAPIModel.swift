//
//  ChatAPIModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 07/05/23.
//

import Foundation

struct ChatItemAPIModel : Codable {
    
    var id : String
    var message : String
    var date : String
    var order_id : String
    var expert_id : String
    var user_id : String
    
}
