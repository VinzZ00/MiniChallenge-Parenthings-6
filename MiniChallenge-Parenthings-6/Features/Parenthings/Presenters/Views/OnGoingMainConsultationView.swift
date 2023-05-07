//
//  OnGoingMainConsultationPage.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 30/04/23.
//

import SwiftUI

struct OnGoingMainConsultationPage: View {
    
    @StateObject var expertViewModel : ExpertViewModel = ExpertViewModel();
    @EnvironmentObject var viewModel : parenthingsViewModel;
    
         //    untuk debug yaa
    var top3Experts : [Expert] {
        return Array(expertViewModel.experts.sorted{$0.starCount > $1.starCount}[0...2])
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
                    ForEach(viewModel.transactions.savedTransaction.filter{
                        $0.isOngoing == true;
                    }, id : \.self) {
                        trx in
                        LongExpertCard(ExpertData: trx.expert, ConusultationData: trx, buttonText: Prompt.Button.chat)
                            .frame(height: 150)
                    }
                    Spacer()
                }
                
            }
            
            
            VStack {
                HStack(){
                    Text("\(Prompt.subTitle.recomendedExpert)")
                        .font(.system(size: 22, weight: .bold))
                    Spacer()
                }
                .padding(.horizontal, Prompt.Padding.paddingMedium)
                
                VStack(alignment: .center) {
                    if expertViewModel.isLoading {
                        ProgressView()
                            .padding(.vertical, Prompt.Padding.paddingLarge)
                    } else {
                        if expertViewModel.experts.isEmpty {
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
                    }
                }
                .padding(.bottom, 20)
                
            }
            
            
            HStack(){
                Text("\(Prompt.subTitle.discoverOther)")
                    .font(.system(size: 22, weight: .bold))
                Spacer()
                Button {
                    
                } label: {
                    VStack {
                        Text(Prompt.Button.seeAll)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(AppColor.paymentBlueTextColor)
                            .padding(EdgeInsets(top: 3, leading: 14, bottom: 3, trailing: 14))
                    }
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(AppColor.paymentBlueTextColor, lineWidth: 1)
                    )
                }
            }.padding(.horizontal, Prompt.Padding.paddingMedium)
            
            if expertViewModel.isLoading {
                ProgressView()
                    .padding(.vertical, Prompt.Padding.paddingLarge)
            } else {
                if (expertViewModel.experts.isEmpty) {
                    Text("No Expert available")
                        .padding(.vertical, 20)
                    
                } else {
                    ScrollView(.horizontal) {
                        
                        HStack {
                            ForEach(
                                expertViewModel.experts.prefix(3)
                                //                            x // Use this for testing
                                , id: \.self) { expert in
                                    ShortExpertCard(ExpertData: expert, buttonText: Prompt.Button.chat)
                                }
                        }
                    }
                    .frame(height: 170)
                    .padding(.horizontal, Prompt.Padding.paddingMedium)
                }
            }
            
            
        }
    }
}

struct OnGoingMainConsultationPage_Previews: PreviewProvider {
    static var previews: some View {
        OnGoingMainConsultationPage()
            .environmentObject(parenthingsViewModel())
    }
}
