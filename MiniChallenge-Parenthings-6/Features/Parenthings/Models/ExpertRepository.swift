//
//  ExpertRepository.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 24/04/23.
//

import Foundation


struct ExpertRepository {
    var savedExpert : [Expert] = []
    
    
    mutating func add(expert: Expert) {
        savedExpert.insert(expert, at: 0)
    }
}
