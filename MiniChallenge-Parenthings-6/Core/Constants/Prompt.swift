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
        static let seeAll = "See All"
        static let continueProcess = "Continue"
        
        static let consultNow = "Consult Now"
        static let startConsulting = "Start Consulting"
        static let reChatExpert = "Rechat Expert"

        static let logIn = "Log In"
        static let logOut = "Log Out"
        static let signMeUp = "I'm New, Sign Me Up"
        
        static let paymentMethod = "Payment Method"
        static let help = "Help"
        static let redeemCoupon = "Redeem Coupon"
        
        static let topUp = "Top Up"
        static let typeTheAmount = "type the amount"
        static let confirmAndTopUp = "Confirm & Top Up"
        
        private init() {}
    }
}

extension Prompt {
    struct Title {
        static let consultation = "Consultation"
        static let consultationDetail = "Consultation Detail"
        static let articles = "Articles"
        static let profiles = "Profiles"
        
        static let logIn = "Log In"
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
        
        static let enterPhoneNum = "Enter your phone number"
        static let otpSentToSms = "OTP sent securely to SMS"
        
        static let welcomeToApp = "Welcome to Parenthings"
        static let thanksForUsing = "Thanks for using Parenthings"
        
        static let chooseAnAmount = "Choose an amount"
        static let topUpAmount = "Top up amount"
        static let selectPaymentMethod = "Select a payment method"
        static let paymentSuccess = "Payment Successful"
        
        private init() {}
    }
}

extension Prompt {
    struct Caption {
        static let appTagline = "Parenting Wisdom in Your Fingertips"
        
        static let welcomeToAppGreetings = "Lorem ipsum dolor sit amet, this is welcomeToAppGreetings variable, go to caption to change text"
        static let thanksForUsingGratitude = "Hope you've solved the problem, See you next time!"
        
        static let enterPhoneNumGuide = "You can log in or make an account if you're new to Parenthings"
        static let otpSentToSmsGuide = "Enter the OTP we've just sent to"

        static let paymentSuccessCelebration = "Hooray! You have completed your payment"
    }
}

extension Prompt {
    struct Info {
        static let phoneNum = "Phone number"
        static let enterOTP = "Enter OTP"
        static let balance = "Balance: "
        static let amountPaid = "AMOUNT PAID"
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
