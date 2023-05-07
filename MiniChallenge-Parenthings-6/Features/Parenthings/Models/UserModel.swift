//
//  UserModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 29/04/23.
//

import Foundation

struct User : Identifiable, Hashable {
    var id : UUID?;
    var name : String
    var balanceParenting : Double;
}
