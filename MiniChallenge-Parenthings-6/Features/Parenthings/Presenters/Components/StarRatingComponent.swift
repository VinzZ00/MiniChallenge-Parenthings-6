//
//  LongCardView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 21/04/23.
//

import SwiftUI

struct StarRatingButton: View {
    @Binding var rating: Int
    
    var maxRating = 5
    
    var body: some View {
        HStack {
            ForEach(0..<maxRating, id : \.self) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 51)
                    .foregroundColor(index < rating ? Color.yellow : Color.gray.opacity(0.2))
                    .onTapGesture {
                        rating = index + 1
                    }
                    
            }
        }
    }
}

struct Previews_StarRatingComponent_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingButton(rating: .constant(4))
    }
}
