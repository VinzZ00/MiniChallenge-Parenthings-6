//
//  ScreenExtension.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation
import UIKit

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
    
    
    func screenHeight2() -> CGFloat{
        
        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? CGFloat(0)
        let bottomPadding = window?.safeAreaInsets.bottom ?? CGFloat(0)
        let height = UIScreen.main.bounds.size.height - topPadding - bottomPadding
        
        return height
    }
}
