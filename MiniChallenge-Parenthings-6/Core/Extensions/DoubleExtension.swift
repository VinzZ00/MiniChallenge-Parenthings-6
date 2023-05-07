//
//  DoubleExtension.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 06/05/23.
//

import Foundation

extension Double {
    func defaultTrailingZero() -> String {
        return String(format: "%.0f", self)
    }
}
