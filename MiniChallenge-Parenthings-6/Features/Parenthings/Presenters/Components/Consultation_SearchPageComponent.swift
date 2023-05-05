//
//  SearchPage.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 26/04/23.
//

import SwiftUI

struct SearchPage: View {
    
    var searchedExperts : [Expert];
    
    var body: some View {
        ForEach(searchedExperts) { expert in
            LongExpertCard(ExpertData: expert, buttonText: Prompt.Button.chat)
        }
    }
}

