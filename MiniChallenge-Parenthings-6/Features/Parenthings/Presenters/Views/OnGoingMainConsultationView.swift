//
//  OnGoingMainConsultationPage.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 30/04/23.
//

import SwiftUI

struct OnGoingMainConsultationPage: View {
    
    @EnvironmentObject var viewModel : parenthingsViewModel;
    
         //    untuk debug yaa
    var top3Experts : [Expert] {
        return Array(viewModel.experts.savedExpert.sorted{$0.starCount > $1.starCount}[0...2])
    }
    
    var body: some View {
        ScrollView(.vertical) {
            
            
            if !viewModel.transactions.savedTransaction.isEmpty {
                VStack{
                    HStack{
                        Text("\(Prompt.subTitle.onGoingConsultation)")
                            .font(.system(size: 22, weight: .bold))
                            .padding(.leading, 18)
                        Spacer();
                    }
                    ForEach(viewModel.transactions.savedTransaction, id : \.self) {
                        trx in
                        LongExpertCard(ExpertData: trx.expert, buttonText: Prompt.Button.chat)
                    }
                }
            }
            
            
            VStack {
                HStack(){
                    Text("\(Prompt.subTitle.recomendedExpert)")
                        .font(.system(size: 22, weight: .bold))
                        .padding(.leading, 18)
                    Spacer()
                }.padding(.bottom, 6)
                Spacer()
                if viewModel.experts.savedExpert.isEmpty {
                    Text("No Expert available")
                        .padding()
                } else {
                    ForEach(
//                        x[0...2]  //Kalo mau test n mattin if
                        top3Experts
                        , id: \.self) { exp in
                            LongExpertCard(ExpertData: exp, buttonText: Prompt.Button.chat)
                        }
                }
                Spacer()
            }
            .frame(height:500)
            
            
            HStack(){
                Text("\(Prompt.subTitle.discoverOther)")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.leading, 18)
                Spacer()
                Button {
                    
                } label: {
                    VStack {
                        Text(Prompt.Button.seeAll)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(AppColor.red)
                            .padding(EdgeInsets(top: 3, leading: 14, bottom: 3, trailing: 14))
                    }
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(AppColor.red, lineWidth: 1)
                    )
                    .padding(.trailing, 18)
                }
            }.padding(.bottom, 6)
                .padding(.top, 19)
            
            if (viewModel.experts.savedExpert.isEmpty) {
                Text("No Expert available")
                    .padding(.vertical, 20)
                
            } else {
                ScrollView(.horizontal) {
                    
                    HStack {
                        ForEach(
                            viewModel.experts.savedExpert.prefix(3)
                            //                            x // Use this for testing
                            , id: \.self) { expert in
                                ShortExpertCard(ExpertData: expert, buttonText: Prompt.Button.chat)
                                    .padding()
                            }
                    }
                }.frame(height: 170)
            }
        }
    }
}

struct OnGoingMainConsultationPage_Previews: PreviewProvider {
    static var previews: some View {
        OnGoingMainConsultationPage()
    }
}
