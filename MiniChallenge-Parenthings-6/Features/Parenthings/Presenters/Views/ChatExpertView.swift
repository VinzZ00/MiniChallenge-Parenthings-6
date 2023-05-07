//
//  ChatExpert.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 02/05/23.
//

import SwiftUI
import Chat

struct ChatExpert: View {
    
    
    //Testing doang
    var selectedExpert : Expert = Expert(id : UUID(), name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false)
//    var selectedConsultation : ConsultationTransaction
    
    @EnvironmentObject var viewModel : parenthingsViewModel;
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    var body: some View {
        VStack{
            
            HStack(spacing: 0){
                
                Button{
                    viewModel.startConsulting = false;
                } label: {
                    Text(.init(systemName: "chevron.left"))
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.leading, 18)
                        .padding(.trailing, 14)
                }
                
                Image(uiImage: (viewModel.selectedConsultation!.expert.imageBase64.toUIImage() ?? UIImage(systemName: "person.fill"))!) // Ganti selected Expert jadi transaction.expert
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 90, height: 90)
                    .padding(.trailing, 14)
                
                VStack(alignment: .leading, spacing: 4){
                    Text("\(viewModel.selectedConsultation!.expert.name)") // Ganti selected Expert jadi transaction.expert
                        .font(.system(size : 22, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("\(.init(systemName: "clock.fill")) \(Int(viewModel.remainingTime/60)) Minutes remaining")
                }
             Spacer()
            }.onReceive(timer) { time in
                if viewModel.remainingTime > 0 {
                    viewModel.remainingTime -= 1
                }
            }
            
            
            ChatView(messages: viewModel.messages) { draft in
                viewModel.send(draft: draft)
            }
            .onAppear{
                viewModel.onStart()
            }
            .onDisappear{
                viewModel.onStop()
            }
            
            
            Spacer();
        }.background(
            VStack{
                Spacer()
            }.background(
                AppBackground()
            )
            .ignoresSafeArea(.keyboard, edges: .bottom)
        )
    }
}
