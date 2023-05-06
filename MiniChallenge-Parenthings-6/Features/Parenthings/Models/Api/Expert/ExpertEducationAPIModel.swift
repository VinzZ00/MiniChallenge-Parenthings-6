//
//  ExpertEducationAPIModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 06/05/23.
//

import Foundation

struct ExpertEducationAPIModel : Codable {
    var id : String
    var name : String
    var yearStart : Int
    var yearEnd : Int
    var expert_id : String
}

enum CodingKeys: String, CodingKey
   {
    case id = "id"
    case name = "name"
    case yearStart = "yearStart"
    case yearEnd = "yearEnd"
    case expert_id = "expert_id"
   }

