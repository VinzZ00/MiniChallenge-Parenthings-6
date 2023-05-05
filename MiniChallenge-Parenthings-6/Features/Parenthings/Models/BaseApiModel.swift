//
//  BaseApiModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 05/05/23.
//

import Foundation

struct BaseApiModel<T: Codable> : Codable {
    var message : String = ""
    var data : T
    
    enum CodingKeys: String, CodingKey
       {
           case message = "message"
           case data
       }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
        self.data = try container.decode(T.self, forKey: .data)

    }
}
