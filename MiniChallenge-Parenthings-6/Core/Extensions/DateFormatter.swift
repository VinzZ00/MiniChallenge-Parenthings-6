//
//  DateFormatter.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 30/04/23.
//

import Foundation


extension Date {
    func dateFormatWithSuffix() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d'\(daySuffix(from: self))' MMMM yyyy"
        
        let formattedDate = dateFormatter.string(from: self)
        
        return formattedDate;
    }
    
    func getTimeOnly() -> DateComponents {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: self)
    }
}

func daySuffix(from date: Date) -> String {
    let dayOfMonth = Calendar.current.component(.day, from: date)
    switch dayOfMonth {
    case 1, 21, 31:
        return "st"
    case 2, 22:
        return "nd"
    case 3, 23:
        return "rd"
    default:
        return "th"
    }
}
