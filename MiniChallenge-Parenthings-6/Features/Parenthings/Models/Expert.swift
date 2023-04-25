//
//  Expert.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 21/04/23.
//

import Foundation
import SwiftUI

typealias encodedBase64 = String;

struct Expert : Identifiable, Hashable {
    let id = UUID();
    var name : String;
    var role : String;
    var education : String
    var educationDesc : String
    var longExp : Int;
    var expDesc : String;
    var price : Double;
    var starCount : Double;
    var imageBase64 : encodedBase64;
    var isAvailable : Bool;
}
