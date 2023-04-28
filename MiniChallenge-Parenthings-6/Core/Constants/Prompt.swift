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
        static let consultationDetail = "Consultation Detail"
        static let articles = "Articles"
        static let profiles = "Profiles"
        static let signIn = "Sign In"
        static let signUp = "Sign Up"
        static let payment = "Payment"
        static let topUp = "Top Up"
        static let topUpConfirmation = "Top Up Confirmation"
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
