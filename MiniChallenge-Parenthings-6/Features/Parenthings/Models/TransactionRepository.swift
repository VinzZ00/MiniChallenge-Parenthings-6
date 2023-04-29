//
//  TransactionRepository.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 30/04/23.
//

import Foundation

struct TransactionRepository {
    var savedTransaction : [ConsultationTransaction] = []
    
    
    mutating func add(transaction: ConsultationTransaction) {
        savedTransaction.insert(transaction, at: 0)
    }
}
