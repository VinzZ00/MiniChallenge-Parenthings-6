//
//  UserModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 29/04/23.
//

import Foundation

struct User : Identifiable, Hashable {
    var id : UUID? = UUID()
    var name : String = ""
    var balanceParenting : Double = 0.0
    
    func sampleData()-> User {
        
        return User(
            id : UUID(),
            name: "Peter Parker"
            ,balanceParenting: 20_000)
    }
}
