//
//  StringExtension.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 03/05/23.
//

import Foundation


extension String {
    
    func getFlag() -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in self.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}
