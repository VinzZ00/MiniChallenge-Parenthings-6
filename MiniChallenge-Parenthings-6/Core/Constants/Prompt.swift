//
//  Prompt.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 23/04/23.
//

import Foundation
import SwiftUI

struct Prompt{
    private init() {}
}



extension Prompt {
    struct Picker {
        static let pickerList : [String] = ["Ongoing", "History"]
        private init() {}
    }
}

extension Prompt {
    struct paymentContent {
        static let expertFee = "Expert Fee"
        static let adminFee = "Admin Fee"
        static let totalPayment = "Total Payment"
        static let defaultDuration = "30 Minutes"
        
        static let electronicMoney = "Electronic Money"
        static let CC_DC = "Credit/Debit Card"
        
        static let yourPayment  = "Your Payment"
        
        static let choosePayment = "Choose your payment method"
        
        private init() {}
    }
}

extension Prompt {
    struct Button {
        static let chat = "Chat"
        static let viewDetail = "View Detail"
        static let logOut = "Log Out"
        static let reChatExpert = "Rechat Expert"
        static let consultNow = "Consult Now"
        static let seeAll = "See All"
        static let topUp = "Top Up"
        static let startConsulting = "Start Consulting"
        
        private init() {}
    }
}

extension Prompt {
    struct Title {
        static let consultation = "Consultation"
        static let articles = "Articles"
        static let profiles = "Profiles"
        static let consultationDetail = "Consultation Detail"
        static let payment  = "Payment"
        
        private init() {}
    }
}

extension Prompt {
    struct subTitle {
        static let recomendedExpert = "Recomended Expert"
        static let discoverOther = "Discover Other"
        static let trending = "Trending"
        static let latestArticles = "Latest Article"
        static let suggestedForYou  = "Suggested For You"
        
        private init() {}
    }
}

extension Prompt {
    struct searchBar {
        static let consultationMainPage = "Search Expert Name"
        static let consultationHistoryPage = "Search Expert or Transaction"
        static let articlesPage = "Search Article Name"
        
        private init() {}
    }
}
