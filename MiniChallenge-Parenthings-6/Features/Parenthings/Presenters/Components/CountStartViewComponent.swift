//
//  SwiftUIView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 21/04/23.
//

import SwiftUI


struct StarRatingView: View {
    var rating: Double
    let maxRating = 5
    
    var body: some View {
            HStack {
                ForEach(1...maxRating, id: \.self) { index in
                    Image(systemName: getStarName(for: index))
                        .frame(width: 12, height: 12)
                        .foregroundColor(.yellow)
                }
            }.padding(.leading, 4)
            .padding(.trailing, 4)
            .padding(.top, 4)
            .padding(.bottom, 4)
    }
    
    private func getStarName(for index: Int) -> String {
        let roundedRating = round(rating * 2) / 2
        if index <= Int(roundedRating) {
            return "star.fill"
        } else if roundedRating - Double(index) >= -0.5 {
            return "star.lefthalf.fill"
        } else {
            return "star"
        }
    }
}

struct Previews_countStartToView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StarRatingView(rating: 5)
                .border(.red)
                
        }.background(.black)
    }
}
