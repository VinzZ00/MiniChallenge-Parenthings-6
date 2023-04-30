//
//  ConsultationDetailView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 30/04/23.
//

import SwiftUI

struct ConsultationDetailView: View {
    
    @State var ratingScore : Int = 0;
    
    var body: some View {
        VStack{
            CustomNavigationBar(title: Prompt.Title.consultationDetail, enableBackButton: true)
            VStack{
                ZStack(alignment: .leading){
                 TopRoundedRectangle(cornerRadius: 10)
                        .foregroundColor(AppColor.systemGray)
                    VStack (alignment: .leading, spacing: 0){
                        Text("Thanks for using ParenThings")
                            .font(.system(size: 17, weight: .semibold))
                            .padding(.top, 13)
                        Text("Hope you've solved the problem. See you next time!")
                            .font(.system(size: 17, weight: .regular))
                        Spacer()
                    }.padding(.leading, 18)
                }.frame(height: 92)
                
                VStack{
                    Text("How was the expert?\n(1 is Disappointing, 5 is awesome)")
                        .multilineTextAlignment(.center)
                        .font(.system(size : 20, weight: .bold))
                }.padding(.top, 23)
                
                StarRatingButton(rating: $ratingScore)
                    .animation(.linear(duration: 0.3), value: ratingScore)
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                
                Rectangle()
                    .foregroundColor(AppColor.grayLightColor)
                    .frame(height: 2)
                    .padding(.horizontal, 18)
                            
                
                Spacer();
            }.offset(y : -46)
            
            Spacer()
        }.background(AppBackground())
    }
}

struct ConsultationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultationDetailView()
    }
}
