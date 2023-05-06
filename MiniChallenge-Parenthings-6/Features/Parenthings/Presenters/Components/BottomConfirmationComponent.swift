//
//  BottomConfirmationComponent.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Celine Margaretha on 04/05/23.
//

import SwiftUI

struct BottomConfirmationComponent: View {
    var body: some View {
        
        //Top up method confirmation
        VStack{
            VStack {
                HStack {
                    Image("")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 35, maxHeight: 35)
                        .background(.pink)
                    
                    VStack(alignment: .leading) {
                        Text(Prompt.paymentContent.topUpWith)
                            .font(.callout)
                            .bold()
                        Button {
                            
                        } label: {
                            Text(Prompt.Caption.selectTopUpWithGuide)
                                .foregroundColor(AppColor.red)
                        }
                        .buttonStyle(.borderless)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Button {
                            
                        } label: {
                            Image(systemName: Prompt.Icon.circleAndThreeDots)
                                .foregroundColor(AppColor.grayOpacity60)
                        }
                        .buttonStyle(.borderless)
                        
                    }
                }
                
                //Button confirm and top up
                VStack {
                    NavigationLink {
                        PaymentSuccessPageView()
                            .navigationBarHidden(true)
                    } label: {
                        Text(Prompt.Button.confirmAndTopUp)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                    }
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .background(AppColor.paymentBlueTextColor)
                    .buttonStyle(.borderless)
                    .cornerRadius(15)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 35)
            .padding(.top, 20)
        
        }
        .background(AppColor.white)
        .frame(maxWidth: .infinity)
        .edgesIgnoringSafeArea(.bottom)
        .shadow(color: AppColor.grayLightColor, radius: 29, x: 0, y: 5)
    }
}

struct BottomConfirmationComponent_Previews: PreviewProvider {
    static var previews: some View {
        BottomConfirmationComponent()
    }
}
