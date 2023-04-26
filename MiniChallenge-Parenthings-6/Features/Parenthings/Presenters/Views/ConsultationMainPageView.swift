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
    
    var x : [Expert] = [Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false) ]
    
    var body: some View {
        NavigationView{
            VStack {
                VStack(spacing: 0){
                    CustomNavigationBar(title: Prompt.Title.consultation, enableBackButton: false, defaultTextSearchBar: Prompt.searchBar.consultationMainPage, searchText: $searchBarValue, enableSearchBar: true)
                    VStack {
                        if (!searchBarValue.isEmpty) {
                            VStack {
                                
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
                                    // x  //Kalo mau test n mattin if
                                    viewModel.experts.savedExpert
                                    , id: \.self) { exp in
                                        LongExpertCard(ExpertData: exp, buttonText: Prompt.Button.chat)
                                            .padding(.bottom, 6)
                                    }
                            }
                            Spacer()
                        }.frame(
                            height: (viewModel.top3Experts.isEmpty) ? 108 : 370)
                        
                        
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
