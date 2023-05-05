//
//  LongCardView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 21/04/23.
//

// Ini height nya gaa bisa sama persis kek di sketch, jdi height nya inherrit aja. ~ Elvin

import SwiftUI

struct LongExpertCard : View {
    
    //  Expert Data
    var ExpertData : Expert?;
    
    var ConusultationData : ConsultationTransaction?;
    
    // Card Component
    var buttonText : String;
    
    @EnvironmentObject var viewModel : parenthingsViewModel;
    
    
    var body: some View {
                HStack{
                    if let decodedimage = (ExpertData ?? ConusultationData!.expert).imageBase64
                        .toUIImage() {
                        Image(uiImage : decodedimage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 67, height: 84)
                            .mask(
                                RoundedRectangle(cornerRadius: 15)
                                
                            )
                            .padding(.trailing, 24)
                        
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Circle()
                                .frame(width: 12, height: 12)
                                .foregroundColor(((ExpertData ?? ConusultationData!.expert).isAvailable) ? .green : .red)
                                .padding(.trailing, 4)
                                .padding(.bottom, 1)
                            Text("\((ExpertData ?? ConusultationData!.expert).name)")
                                .font(.system(size: 16, weight: .semibold))
                                .lineLimit(2)
                                .foregroundColor(AppColor.titleColor)
                                .fixedSize(horizontal: false, vertical: true)
                                .minimumScaleFactor(0.75)
                        }
                        
                        Text("\((ExpertData ?? ConusultationData!.expert).role)")
                            .font(.system(size : 12))
                            .foregroundColor(AppColor.grayOpacity60)
                            .padding(.bottom, 4)
                        
                        HStack {
                            HStack {
                                Image(systemName: "cross.case.fill")
                                Text("\((ExpertData ?? ConusultationData!.expert).longExp) Years")
                                    .font(.system(size: 12))
                                
                            }
                            .frame(width: 77, height: 22)
                            .padding(EdgeInsets(top: 3, leading: 8, bottom: 3, trailing: 8))
                            .foregroundColor(AppColor.grayOpacity60)
                            .background(AppColor.systemGray)
                            .cornerRadius(5)
                            
                            Spacer()
                            Text("Rp. \(String(format :  "%.2f", (ExpertData ?? ConusultationData!.expert).price))")
                                .font(.system(size: 13, weight: .semibold))
                        }
                        
                        HStack {
                            StarRatingView(rating: (ExpertData ?? ConusultationData!.expert).starCount)
                            Spacer()
                            Button {
                                if (self.buttonText == Prompt.Button.chat) {
                                    if ((ConusultationData?.isOngoing) != nil) {
                                        withAnimation{
                                            viewModel.selectedConsultation = ConusultationData!
                                            viewModel.startConsulting = true;
                                        }
                                    } else {
                                        withAnimation {
                                            viewModel.expertDetailIsPresented = true
                                            viewModel.selectedExpert = ExpertData
                                        }
                                    }
                                } else if (self.buttonText == Prompt.Button.viewDetail) {
                                    withAnimation {
                                        viewModel.consultationDetailIsPresented = true
                                        
                                        viewModel.selectedConsultation = ConusultationData;
                                    }
                                } else if (self.buttonText == Prompt.Button.viewDetail) {
                                    withAnimation {
                                        viewModel.isDetailConsultationShown = true
                                    }
                                }
                            } label: {
                                VStack {
                                    Text(buttonText)
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                }
                                .frame(width: 70, height: 22)
                                .background(AppColor.paymentBlueTextColor)
                                .cornerRadius(5)
                            }
                        }
                        
                    }
                    Spacer()
                }.padding(EdgeInsets(
                    top:CGFloat(Prompt.Padding.CardPadding.ExpertCard.vertical),
                    leading: CGFloat(Prompt.Padding.CardPadding.ExpertCard.horizontal),
                    bottom: CGFloat(Prompt.Padding.CardPadding.ExpertCard.vertical),
                    trailing: CGFloat(Prompt.Padding.CardPadding.ExpertCard.horizontal)
                ))
                    .background(.white)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(AppColor.systemGray, lineWidth: 2)
                    )
                    .padding(.horizontal, 18)
    }
}

struct LongCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Spacer();
            if (UIImage(systemName: "person.fill")?.toBase64()) != nil
            {

                LongExpertCard(ExpertData: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), buttonText: "Click")
                    .background(.red)
//                LongExpertCard(ExpertData: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), buttonText: "Click")
            }
            Spacer();
        }.background(.white)
    }
}
