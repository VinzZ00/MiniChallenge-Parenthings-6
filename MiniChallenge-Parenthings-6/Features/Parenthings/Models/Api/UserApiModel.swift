//
//  UserApiModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation


struct UserApiModel : Codable {
    var id : String = ""
    var name : String = ""
    var phone : String = ""
    var balance : Double = 0.0

    enum CodingKeys: String, CodingKey
       {
           case id = "id"
           case name = "name"
           case phone = "phone"
           case balance = "balance"
       }
}
