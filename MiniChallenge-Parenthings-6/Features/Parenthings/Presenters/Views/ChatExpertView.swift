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
//    var selectedExpert : Expert = Expert(id : UUID(), name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false)
//    var selectedConsultation : ConsultationTransaction
    @State var selectedExpert : Expert;
    @StateObject var userViewModel = UserViewModel()
    @State var userApiModel: UserApiModel = UserApiModel()
    @EnvironmentObject var viewModel : parenthingsViewModel;
    @State var chatViewModel : ChatViewModel?

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
                
                AsyncImage(url: URL(string: selectedExpert.imageBase64 ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 63, height: 63)
                       
                } placeholder: {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 63, height: 63)

                    
                }
                
                VStack(alignment: .leading, spacing: 4){
                    Text("\(selectedExpert.name)") // Ganti selected Expert jadi transaction.expert
                        .font(.system(size : 22, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("\(.init(systemName: "clock.fill")) \(Int(viewModel.remainingTime/60)) Minutes remaining")
                        .foregroundColor(.white)
                }
             Spacer()
            }.onReceive(timer) { time in
                if viewModel.remainingTime > 0 {
                    viewModel.remainingTime -= 1
                }
            }
            
            ChatView(messages: chatViewModel?.messages ?? []) { draft in
                chatViewModel?.send(draft: draft)
            }
            .enableLoadMore(offset: 3) { message in
                       viewModel.loadMoreMessage(before: message)
                   }
            .onAppear{
                chatViewModel?.onStart()
            }
            .onDisappear{
                chatViewModel?.onStop()
            }
            
            
            Spacer();
        }
        .onAppear{
            userApiModel = userViewModel.getLoginSession() ?? UserApiModel()
            selectedExpert = viewModel.getSelectedExpert()!
            let userChat = User(id: UUID(uuidString: userApiModel.id ), name: userApiModel.name , balanceParenting: userApiModel.balance )
            self.chatViewModel = ChatViewModel(currentUser: userChat, expert: selectedExpert);
            
            
        }
        .background(
            VStack{
                Spacer()
            }.background(
                AppBackground()
            )
            .ignoresSafeArea(.keyboard, edges: .bottom)
        )
    }
}
