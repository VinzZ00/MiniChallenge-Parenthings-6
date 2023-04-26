//
//  SearchPage.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 26/04/23.
//

import SwiftUI

struct SearchPage: View {
    
    var searchedExperts : [Expert];
    var totalPage : Int;
    var leftOverCardCount : Int;
    @State var currentPage : Int;
    
    
    
    
    init(selectedExpert : [Expert]) {
        self.searchedExperts = selectedExpert;
        self.totalPage = searchedExperts.count/4 + ((searchedExperts.count%4 != 0) ? 1 : 0);
        self.leftOverCardCount = searchedExperts.count % 4
        self.currentPage = 0;
        
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance()
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    
    var body: some View {
        VStack{
            TabView(selection: $currentPage) {
                ForEach(0..<totalPage, id : \.self) { indx in
                    
                    
                    if leftOverCardCount < 1
                    {
                        
                        let startIndx = indx * 4
                        let endIndx = (indx * 4) + 3
                        
                        ExpertGridView(experts: Array(searchedExperts[startIndx...endIndx]))
                    }
                    else
                    {
                        if indx == totalPage - 1 {
                            let startIndx = indx * 4
                            let endIndx = (indx * 4) + (leftOverCardCount-1)
                            
                            ExpertGridView(experts: Array(searchedExperts[startIndx...endIndx]))
                        } else {
                            let startIndx = indx * 4
                            let endIndx = (indx * 4) + 3
                            
                            ExpertGridView(experts: Array(searchedExperts[startIndx...endIndx]))
                        }
                    }
                }
            }
            .frame(height: 400)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            
        }
    }
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack{
            
            Spacer()
            
            SearchPage(selectedExpert: [Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Peter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "PUtter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Parker Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Parker Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Andy Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "PUtter Parker", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false), Expert(name: "Doctor. Strange", role: "Dokter Kandungan",education: "Dokter", educationDesc: "EducationDescription", longExp: 5, expDesc: "Experience Description", price: 20000, starCount: 4.5, imageBase64: (UIImage(named: "UniversalPlaceHolder")?.toBase64())!, isAvailable: false)])
                .border(.black)
        
            Spacer()
            
        }
    }
}
