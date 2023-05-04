//
//  ConsultationTransactionModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 28/04/23.
//
import Foundation

struct ConsultationTransaction : Identifiable, Hashable {
    let id : UUID = UUID();
//    Field Usernya at least User ny lah, buat bisa ke CoreData supaya bisa di bikin di historynya nanti.
    let expert : Expert;
    let TransactionDate : Date;
    var adminFee : Double {
        return expert.price / 100 * 10
    }
    var payWith : TypePayment;
    
    var isOngoing : Bool {
        let finishWhen : Date = TransactionDate.addingTimeInterval(40*60)
        
        if finishWhen < Date() {
            return false
        } else {
            return true
        }
    }
    
//    var timeStart : DateComponents {
//        return TransactionDate.getTimeOnly()
//    }
    
    var totalPrice : Double  {
        return adminFee + expert.price
    }
}
