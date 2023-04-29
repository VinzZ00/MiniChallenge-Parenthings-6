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
    
    @ObservedObject var viewModel : parenthingsViewModel = parenthingsViewModel()
    
//    var x : [Expert] = [Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Strange Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false) ] untuk debug yaa
    
    var body: some View {
        NavigationView{
            VStack {
                VStack(spacing: 0){
                    CustomNavigationBar(title: Prompt.Title.consultation, enableBackButton: false, defaultTextSearchBar: Prompt.searchBar.consultationMainPage, searchText: $searchBarValue, enableSearchBar: true)
                    VStack {
                        if (!searchBarValue.isEmpty) {
                            VStack {
                                SearchPage(selectedExpert:  viewModel.experts.savedExpert.filter{
                                    $0.name.contains(searchBarValue)
                                })
                                .frame(maxHeight: 320)
                                .padding(.vertical, 16)
                            }
                        }
                    }
                        
                    
                    VStack {
                        Picker("listFilter", selection: $SegmentedPickerValue) {
                            ForEach( Prompt.Picker.pickerList, id : \.self) {item in
                                Text(item).tag(item)
                            }
                        }.pickerStyle(.segmented)
                            .padding(EdgeInsets(top: 2, leading: 18, bottom: 18, trailing: 18))
                        
                        if (SegmentedPickerValue == "Ongoing"){
                            OnGoingMainConsultationPage(viewModel: self.viewModel)
                        } else {
                            
//                            ForEach(Array(viewModel.getUniqueTransactionDate()), id : \.self ) { date in
                            VStack{
                                HStack{
                                    Text(Date().dateFormatWithSuffix())
                                        .font(.system(size: 22, weight: .bold))
                                    Spacer();
                                }
                                
                                ForEach(Array(viewModel.transactions.savedTransaction.filter{
                                    $0.TransactionDate == Date()
                                }), id : \.self) {
                                    trx in
                                    LongExpertCard(ExpertData: trx.expert, buttonText: Prompt.Button.viewDetail)
                                }
                            }.padding(.leading, 16)
//                            }
                        }
                        
                        
                        
                        Spacer()
                    }
                    .blur(radius: searchBarValue.isEmpty ? 0 : 20)
                }.navigationBarHidden(true)
                    .background(AppBackground()
                        .blur(radius: searchBarValue.isEmpty ? 0 : 20))
            }
        }
    }
}

struct ConsultationMainPageView_Previews: PreviewProvider {
    
    static var previews: some View {
        ConsultationMainPageView()
    }
    
}
