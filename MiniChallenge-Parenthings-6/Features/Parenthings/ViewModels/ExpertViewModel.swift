//
//  Expert.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 21/04/23.
//

import Foundation
import SwiftUI

struct ExpertViewModel : Identifiable, Hashable {
    let id = UUID();
    var name : String;
    var role : String;
    var longExp : Int;
    var Price : Double;
    var StarCount : Double;
    var imageBase64 : String
}
