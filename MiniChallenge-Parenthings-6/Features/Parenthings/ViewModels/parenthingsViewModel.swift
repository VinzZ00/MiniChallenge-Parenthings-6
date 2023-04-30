//
//  parenthingsViewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 22/04/23.
//

import Foundation
import SwiftUI

class parenthingsViewModel : ObservableObject {
    
    @Published var experts : ExpertRepository = ExpertRepository();
    @Published var top3Experts : [Expert] = Array()
    
    @Published var transactions : TransactionRepository = TransactionRepository();
    
    @Published var parentingSelected : Bool = true;
    @Published var goPaySelected : Bool = false;
    @Published var ovoSelected : Bool = false;
    @Published var danaSelected : Bool = false;
    
    func getUniqueTransactionDate() -> Set<Date>{
        
        var DatesUnUnique : [Date] = [];
        
        for trx in transactions.savedTransaction {
            DatesUnUnique.append(trx.TransactionDate)
        }
        
        return Set(DatesUnUnique);
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


