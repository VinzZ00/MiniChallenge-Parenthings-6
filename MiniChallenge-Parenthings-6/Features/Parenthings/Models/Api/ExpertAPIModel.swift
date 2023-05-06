//
//  ExpertAPIModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 06/05/23.
//

import Foundation

struct ExpertAPI : Codable, Hashable {
    var id : String = ""
    var name : String = ""
    var year_of_experience : Int = 0
    var price : Double = 0;
    var active_hour_start : String = ""
    var active_hour_end : String = ""
    var photo_url : String = ""

    enum CodingKeys: String, CodingKey
       {
        case id = "id"
        case name = "name"
        case year_of_experience = "year_of_experience"
        case price = "price"
        case active_hour_start = "active_hour_start"
        case active_hour_end = "active_hour_end"
        case photo_url = "photo_url"
       }
}
