//
//  String<->base64.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 22/04/23.
//

import Foundation
import SwiftUI

extension encodedBase64 {
    func toUIImage() -> UIImage? {
        if let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) {
            if let image = UIImage(data: imageData) {
                return image
            }
        }
        return nil;
    }
}

