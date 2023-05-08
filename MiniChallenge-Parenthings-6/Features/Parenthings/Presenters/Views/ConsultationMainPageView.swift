//
//  ConsultationMainPageView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 24/04/23.
//

import SwiftUI

struct ConsultationMainPageView: View {
    
    @State var searchBarValue : String = "";
    @State var SegmentedPickerValue : String = "Ongoing"
    
    @StateObject var expertViewModel : ExpertViewModel = ExpertViewModel();
    @StateObject var orderViewModel : ExpertViewModel = ExpertViewModel();
    @EnvironmentObject var viewModel : parenthingsViewModel
    
    var backButton : () -> Void;
    
    
    //    var x : [Expert] = [Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Strange Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false) ] untuk debug yaa
    
    var body: some View {
        NavigationView{
            if (viewModel.textFieldIsClicked) {
                ConsultationSearchPage()
            } else {
                VStack(spacing: 0){
                    CustomNavigationBar(title: Prompt.Title.consultation, enableBackButton: false, defaultTextSearchBar: Prompt.searchBar.consultationMainPage, searchText: $searchBarValue, enableSearchBar: true, backButton: {})
                    VStack {
                        Picker("listFilter", selection: $SegmentedPickerValue) {
                            ForEach( Prompt.Picker.pickerList, id : \.self) {item in
                                Text(item).tag(item)
                            }
                        }.pickerStyle(.segmented)
                            .padding(EdgeInsets(top: 2, leading: 18, bottom: 18, trailing: 18))
                        
                        if (SegmentedPickerValue == "Ongoing"){
                            OnGoingMainConsultationPage()
                        } else {
                            ScrollView(.vertical) {
                                VStack{
                                    ForEach(Array(viewModel.getUniqueTransactionDate()), id : \.self ) { date in
                                        VStack(alignment: .leading){
                                            HStack{
                                                Text(date.dateFormatWithSuffix())
                                                    .font(.system(size: 22, weight: .bold))
                                                Spacer();
                                            }
                                            
                                            ForEach(Array(viewModel.transactions.savedTransaction.filter{
                                                let calendar = Calendar.current
                                                let transactionDate = calendar.component(.day, from: $0.TransactionDate)
                                                let clasifyDate = calendar.component(.day, from : date)
                                                
                                                return transactionDate == clasifyDate;
                                            }), id : \.self) {
                                                trx in
                                                
                                                VStack (alignment: .leading ,spacing: 0){
                                                    Text("\(trx.TransactionDate.getTimeOnly().hour!).\(trx.TransactionDate.getTimeOnly().minute!) - \(trx.TransactionDate.addingTimeInterval(40*60).getTimeOnly().hour!).\(trx.TransactionDate.addingTimeInterval(40*60).getTimeOnly().minute!)")
                                                        .font(.system(size: 13, weight: .semibold))
                                                        .foregroundColor(AppColor.systemGrayDarker)
                                                    LongExpertCard(ExpertData: trx.expert, ConusultationData : trx, buttonText: Prompt.Button.viewDetail)
                                                        .frame(height: 150)
                                                }
                                            }
                                        }.padding(.leading, 16)
                                        
                                    }
                                    Spacer();
                                }
                            }
                        }
                        Spacer()
                    }
                }
                .onAppear{
//                    orderViewModel.getAllOrder()
                }
                .transition(.move(edge: .top))
                .background(AppBackground())
                .navigationBarHidden(true)
                .ignoresSafeArea(.keyboard, edges: .bottom)
                
            }
        }
    }
}


struct ConsultationMainPageView_Previews: PreviewProvider {
    
    static var previews: some View {
        ConsultationMainPageView(backButton: {}).environmentObject(parenthingsViewModel())
    }
    
}
