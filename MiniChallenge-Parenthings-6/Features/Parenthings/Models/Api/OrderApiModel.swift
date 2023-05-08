//
//  OrderApiModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 08/05/23.
//

import Foundation

struct OrderApiModel : Codable {
    
    var id : String = ""
    var date : String = ""
    var adminFee : Double = 0.0
    var status : Int = 0
    var duration : Int = 0
    var rating : Int = 0
    var userId : String = ""
    var expertId : String = ""
    var couponId : String = ""

    
    enum CodingKeys: String, CodingKey
       {
           case id = "id"
           case date = "phone"
           case adminFee = "admin_fee"
           case status = "status"
           case duration = "duration"
           case rating = "rating"
           case userId = "user_id"
           case expertId = "expert_id"
           case couponId = "coupon_id"
       }
}
