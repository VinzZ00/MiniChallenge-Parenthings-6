//
//  Expert.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 21/04/23.
//

import Foundation
import SwiftUI

typealias encodedBase64 = String;

struct Expert : Codable, Identifiable, Hashable {
    let id : UUID?
    var name : String = ""
    var role : String = ""
    var education : String = ""
    var educationDesc : String = ""
    var longExp : Int = 0
    var expDesc : String = ""
    var price : Double = 0.0
    var starCount : Double = 0.0
    var imageBase64 : encodedBase64 = ""
    var isAvailable : Bool = false
    
    
    func sampleData(img: String = "UniversalPlaceHolder")-> Expert {
        
        
        return Expert(
            id : UUID(),
            name: "Peter Parker"
                      ,role: "Dokter Kandungan"
                      ,education: "Dokter"
                      ,educationDesc: "EducationDescription"
                      ,longExp: 5
                      ,expDesc: "Experience Description"
                      ,price: 20_000
                      ,starCount:  4.5
                      ,imageBase64: (UIImage(named: img)?.toBase64()) ?? ""
                      ,isAvailable: false)
    }
}

