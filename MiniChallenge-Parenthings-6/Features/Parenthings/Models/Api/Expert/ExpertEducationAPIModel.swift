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
    var year_start : Int
    var year_end : Int
    var expert_id : String
}

enum CodingKeys: String, CodingKey
   {
    case id = "id"
    case name = "name"
    case year_start = "year_start"
    case year_end = "year_end"
    case expert_id = "expert_id"
   }

