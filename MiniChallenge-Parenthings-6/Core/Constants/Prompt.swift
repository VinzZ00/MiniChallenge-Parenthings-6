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
    struct Icon {
        //system icon
        static let logOut = "rectangle.portrait.and.arrow.right.fill"
        static let help = "questionmark.circle.fill"
        static let edit = "pencil.line"

        static let topUp = "plus.app.fill"
        static let paymentMethod = "creditcard.fill"
        static let reedeemCoupon = "ticket.fill"
        static let checkMarkSeal = "checkmark.seal.fill"
        static let checkMarkCircle = "checkmark.circle.fill"
        
        
        static let add = "plus.circle.fill"
        static let circleAndThreeDots = "ellipsis.circle.fill"
        static let amount1 = "IconTopUpAmount1"
        static let amount2 = "IconTopUpAmount2"
        static let amount3 = "IconTopUpAmount3"
        static let amount4 = "IconTopUpAmount4"
        static let amount5 = "IconTopUpAmount5"
        static let amount6 = "IconTopUpAmount6"
        
        //custom icon
        static let promoCode = "IconPromoCode"
        
        private init() {}
    }
}

extension Prompt {
    struct paymentContent {
        static let expertFee = "Expert Fee"
        static let adminFee = "Admin Fee"
        static let totalPayment = "Total Payment"
        static let defaultDuration = "40 Minutes"
        
        static let electronicMoney = "Electronic Money"
        static let CC_DC = "Credit/Debit Card"
        
        static let yourPayment  = "Your Payment"
        
        static let choosePayment = "Choose your payment method"
        
        static let balance = "Balance: "
        static let chooseAmount = "Choose an amount"
        
        static let topUpWith = "Top up with"
        static let topUpTo = "Top up to"
        static let topUpDetail = "Top up detail"
        static let topUpAmount = "Top up amount"
        static let topUpFee = "Top up fee"
        static let total = "Total"

        static let amountPaid = "Amount Paid"
        static let balanceAdded = "Balance Added"
        
        static let redeemCode = "coupon code"
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

        static let next = "Continue"
        static let logIn = "Log In"
        static let logOut = "Log Out"
        static let signUp = "I'm New, Sign Me Up"
          
        static let paymentMethod = "Payment Method"
        static let help = "Help"
        static let redeemCoupon = "Redeem Coupon"
        static let verifyCode = "Verify Your Code"
          
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
        static let redeemCoupon = "Redeem Coupon"
        
        private init() {}
    }
}

extension Prompt {
    struct subTitle {
        static let recomendedExpert = "Recomended Expert"
        static let discoverOther = "Discover Other"
        static let onGoingConsultation = "Ongoging Consultation"

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
        static let haveCouponCode = "Have a coupon code?"
        
        static let paymentSuccess = "Payment Successful"
        static let couponVerified = "Coupon Verified"
        
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
        static let enterCouponGuide = "Enter your coupon code below to redeem it"
        static let selectTopUpWithGuide = "Select a top up method"
        static let selectTopUpMethodGuide = "Select a method first"
        static let enterTopUpAmount = "Enter top up amount"

        static let paymentSuccessCelebration = "Hooray! You have completed your payment"
        static let couponVerifiedCelebration = "Hooray! Your Coupon Have Been Verified"
        
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



extension Prompt {
    struct Network {
        static let somethingWrong = "Sorry, something went wrong."
        static let connectionFailed = "Sorry, the connection to our server failed."
        
        static let unknownError = "Unknown Error."
        static let invalidURL = "Invalid URL."
        static let urlSessionError = "URL session error."
        static let parsingError = "Parsing error  %@."
        static let badResponse = "Bad response with status code %@."
        
        private init() {}
    }
}

extension Prompt {
    struct AlertTitle {
        static let logOut = "Log Out"
        private init() {}
    }
}
extension Prompt {
    struct AlertMessages {
        static let logOutMessage = "Are you sure you want to log out?"
        private init() {}
    }
}

extension Prompt {
    struct ActionSheeetDialog {
        static let logOutMessage = "Are you sure you want to log out?"
        private init() {}
    }
}
