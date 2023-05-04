//
//  StringExtension.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 03/05/23.
//

import Foundation
import SwiftUI

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

extension StringProtocol {
    func htmlToAttributedString() throws -> AttributedString {
        try .init(
            .init(
                data: .init(utf8),
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            )
        )
    }
}

extension Text {
    init(html: String, alert: String? = nil) {
        do {
            try self.init(html.htmlToAttributedString())
        } catch {
            self.init(alert ?? error.localizedDescription)
        }
    }
}
