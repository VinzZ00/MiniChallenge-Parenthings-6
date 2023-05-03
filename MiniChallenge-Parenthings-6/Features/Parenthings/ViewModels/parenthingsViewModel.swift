//
//  parenthingsViewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 22/04/23.
//

import Foundation
import SwiftUI

class parenthingsViewModel : ObservableObject {
    @Published var expertDetailIsPresented : Bool = false;
    @Published var selectedExpert : Expert?
    
    @Published var consultationDetailIsPresented : Bool = false;
    @Published var selectedConsultation : ConsultationTransaction?
    
    
    @Published var user : User? = User(name: "Elvin", balanceParenting: 20000); //in Production ini tidak diisi disini tp, dari sign in page.
    @Published var experts : ExpertRepository = ExpertRepository();
    
    @Published var navBarShown : Bool = true;
    @Published var transactions : TransactionRepository = TransactionRepository();
    
    @Published var parentingSelected : Bool = true;
    @Published var goPaySelected : Bool = false;
    @Published var ovoSelected : Bool = false;
    @Published var danaSelected : Bool = false;
    
    
    @Published var startConsulting : Bool = false;
    @Published var remainingTime : Int  = 0;
//    @Published var CurrenttimeRemaining?;
//    @Published var buttonClicked : Bool = false;
    

    
    
    
    
    func getUniqueTransactionDate() -> Set<Date>{
//        var DatesUnUnique : [Date] = transactions.savedTransaction[0].TransactionDate
//        if !transactions.savedTransaction.isEmpty {
//            DatesUnUnique.insert(transactions.savedTransaction[0].TransactionDate)
//        }
        let calendar = Calendar.current
        
        var uniqueDates = Set<Date>()
        
        for trx in transactions.savedTransaction {
            let uniqueDate = calendar.startOfDay(for: trx.TransactionDate)
               uniqueDates.insert(uniqueDate)
        }
        
        return Set(uniqueDates);
    }
    
    
//    var name : String = ""
//    var role : String = ""
//    var longExp : Int = 0
//    var Price : Double = 0.00
//    var StarCount : Double = 0.00
//    var imageBase64 : encodedBase64 = ""
    
    
    // Field apa aja??
    
//    var expertImage : Image? {
//        let uiImage = imageBase64.toUIImage()
//
//        if let image = uiImage {
//            return Image(uiImage: image)
//        } else {
//            return nil
//        }
//    }
}


