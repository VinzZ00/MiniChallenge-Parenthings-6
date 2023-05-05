//
//  ExpertDetail.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 25/04/23.
//

import SwiftUI

struct ExpertDetail: View {
    
    @EnvironmentObject var viewModel : parenthingsViewModel;
    @State var consultNow : Bool = false;
    @Environment(\.presentationMode) var presentationMode
    
    
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                CustomNavigationBar(title: Prompt.Title.consultation,
                                    enableBackButton: true, backButton: {
                    withAnimation {
                        viewModel.expertDetailIsPresented = false
                    }
                })
                
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading){
                        HStack {
                            Spacer()
                            ExpertDetailImage(selectedExpert: viewModel.selectedExpert!)
                                .background(AppColor.systemGray.opacity(0.75))
                                .cornerRadius(10)
                            Spacer()
                            
                        }
                        
                        Text("\(viewModel.selectedExpert!.name)")
                            .font(.system(size: 22, weight: .bold))
                            .padding(.leading, 16)
                            .foregroundColor(AppColor.titleColor)
                        Text("\(viewModel.selectedExpert!.role)")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(AppColor.expertTextGrayColor)
                            .padding(.leading, 16)
                        
                        HStack{
                            HStack {
                                Image(systemName: "cross.case.fill")
                                Text("\(viewModel.selectedExpert!.longExp) Years")
                                    .font(.system(size: 12))
                                
                            }
                            .frame(width: 77, height: 22)
                            .padding(EdgeInsets(top: 3, leading: 8, bottom: 3, trailing: 8))
                            .foregroundColor(AppColor.grayOpacity60)
                            .background(AppColor.systemGray)
                            .cornerRadius(5)
                            
                            HStack {
                                Image(systemName: "hand.thumbsup.fill")
                                Text("\(String(format: "%.1f", viewModel.selectedExpert!.starCount))  Stars")
                                    .font(.system(size: 10))
                                
                            }
                            .frame(width: 77, height: 22)
                            .padding(EdgeInsets(top: 3, leading: 8, bottom: 3, trailing: 8))
                            .foregroundColor(AppColor.grayOpacity60)
                            .background(AppColor.systemGray)
                            .cornerRadius(5)
                        }.padding(.leading, 16)
                        
                        Text("\(String(format : "Rp. %.0f", viewModel.selectedExpert!.price))")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(AppColor.titleColor)
                            .padding(.leading, 16)
                        
                        Divider()
                            .background(.black)
                            .padding(.horizontal, 16)
                        
                        VStack{
                            ExpertDetailVerticalTrait(traitIcon: Image(systemName: "graduationcap.fill"), traitTitle: "Education", traitDescription: viewModel.selectedExpert!.educationDesc)
                                .padding()
                            ExpertDetailVerticalTrait(traitIcon: Image(systemName: "case.fill"), traitTitle: "Experience", traitDescription: viewModel.selectedExpert!.expDesc)
                                .padding(.leading, 16)
                        }
                        
                        
                        Spacer()
                        
                        HStack{
                            Spacer()
                            Button(action: {
                                consultNow = true
                            }, label: {
                                VStack {
                                    Spacer();
                                    Text(Prompt.Button.consultNow)
                                        .font(.system(size: 22,     weight: .bold))
                                        .foregroundColor(.white)
                                    Spacer();
                                }
                                .frame(width: 358, height: 53)
                                .background(AppColor.paymentBlueTextColor)
                                .cornerRadius(15)
                                
                            })
                            Spacer()
                            
                        }
                        Spacer();
                    }
                }
                    .frame(height: 640)
               
                if viewModel.user != nil
                {
                    NavigationLink("", destination: ExpertPaymentView(expert: viewModel.selectedExpert!).navigationBarHidden(true), isActive: $consultNow)
                } else {
                    if consultNow {
                        NavigationLink("", destination: SignInPopUP().navigationBarHidden(true), isActive: .constant(viewModel.user == nil))
                    }
                }
                
            }
            .transition(.move(edge: .leading))
            .background(
                AppBackground()
            )
            
            
            
            
        }
    }
}

//struct ExpertDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpertDetail(vm : parenthingsViewModel(), selectedExpert: Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), loggedUser: User(name: "Elvin", balanceParenting: 2000))
//    }
//}
