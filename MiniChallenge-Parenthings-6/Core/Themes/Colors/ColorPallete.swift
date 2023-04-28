//
//  ColorPallete.swift
//  MiniChallege-parenthings
//
//  Created by Elvin Sestomi on 20/04/23.
//

import SwiftUI

struct AppColor {
    
    static let red : Color = Color(red: 255/255, green: 45/255, blue: 85/255)
    static let systemGrayDarker : Color = Color(UIColor(red:0.557, green:0.557, blue:0.576, alpha:1.00))
    static let systemGray : Color = Color(red: 242/255, green: 242/255, blue: 247);
    static let green: Color = Color(UIColor(red:0.204, green:0.780, blue:0.349, alpha:1.00))
    static let systemPink : Color = Color(UIColor(red:1.000, green:0.176, blue:0.333, alpha:1.00))
    static let white : Color = Color(UIColor(red:1.000, green:1.000, blue:1.000, alpha:1.00))
    
    static let gradientColorBottomRight : Color = Color(red: 20/255, green: 108/255, blue: 148/255)
    static let gradientColorTopLeft : Color  = Color(red: 25/255, green: 167/255, blue: 206/255)
    
    static let grayOpacity60 : Color = Color(UIColor(red:0.235, green:0.235, blue:0.263, alpha:0.60))
    
    static let systemGreen : Color = Color(UIColor(red:0.204, green:0.780, blue:0.349, alpha:1.00))
    
    static let expertTextGrayColor : Color = Color(UIColor(red:0.235, green:0.235, blue:0.263, alpha:0.60))
    
    static let gradientLandingPage : LinearGradient = LinearGradient(colors: [Color(hex: 0xf6f1f1), Color(hex: 0xDDE9ED), Color(hex: 0xC1DFE9), Color(hex: 0xA7D7E4), Color(hex: 0x19A7CE)], startPoint: .top, endPoint: .bottom)
    
    static let paymentGrayTextColor : Color = Color(UIColor(red:0.235, green:0.235, blue:0.263, alpha:0.60))
    static let paymentBlueTextColor : Color = Color(UIColor(red:0.078, green:0.424, blue:0.580, alpha:1.00))
    
    private init(){}
    
}


