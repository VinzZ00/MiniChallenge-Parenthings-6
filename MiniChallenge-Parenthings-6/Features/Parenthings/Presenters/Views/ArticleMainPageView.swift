//
//  ArticleMainPageView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation
import SwiftUI

struct ArticleMainPageView: View {
    @StateObject var articleViewModel = ArticleViewModel()
    @State var searchBarValue : String = "";
    @EnvironmentObject var viewModel : parenthingsViewModel
    
    var backButton : () -> Void;
    
    var body: some View {
        ZStack{
            contentView
            if(articleViewModel.isLoading){
                ProgressPage()
            }
        }
        .onAppear{
            articleViewModel.getArticle()
        }
        .alert(articleViewModel.errorMessage ?? "",
               isPresented: $articleViewModel.isError) {
        }
    }
    
    var contentView: some View {
        NavigationView{
            VStack(spacing: 0){
                CustomNavigationBar(title: Prompt.Title.articles, enableBackButton: false, defaultTextSearchBar: Prompt.searchBar.articlesPage, searchText: $searchBarValue, enableSearchBar: true, backButton: self.backButton)
                VStack {
                    if (!searchBarValue.isEmpty) {
                        
                        VStack {
                            ArticleSearchPage(searchedExperts: [Expert().sampleData(), Expert().sampleData()])
                                .padding(.vertical, 16)
                        }
                    }else{
                        ScrollView(.vertical) {
                            
                            VStack{
                                HStack{
                                    Text(Prompt.subTitle.trending)
                                        .font(.system(size: 22, weight: .bold))
                                        .padding(.leading, 18)
                                    Spacer();
                                }
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(0..<articleViewModel.articles.count, id : \.self) {
                                            pos in
                                            NavigationLink(destination: ArticleDetailView(article: self.articleViewModel.articles[pos],backButton: backButton)) {
                                                LongArticleCard(articleData: articleViewModel.articles[pos], buttonText: Prompt.Button.chat)
                                                    .padding(0)
                                            }
                                        }
                                    }
                                }
                                
                                Spacer()
                            }
                            
                            VStack{
                                HStack(){
                                    Text("\(Prompt.subTitle.latestArticles)")
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
                                ScrollView(.horizontal) {
                                    HStack(spacing: 0){
                                        ForEach(1..<3, id : \.self) {
                                            pos in
                                            NavigationLink(destination: ArticleDetailView(article: self.articleViewModel.articles[pos],backButton: backButton)) {
                                                ShortArticleCard(articleData: articleViewModel.articles[pos], buttonText: Prompt.Button.chat)
                                                    .padding(0)
                                            }
                                        }
                                    }
                                }
                                
                                Spacer()
                            }
                            VStack{
                                HStack(){
                                    Text("\(Prompt.subTitle.suggestedForYou)")
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
                                ScrollView(.horizontal) {
                                    HStack(spacing: 0){
                                        ForEach(3..<5, id : \.self) {
                                            pos in
                                            NavigationLink(destination: ArticleDetailView(article: self.articleViewModel.articles[pos],backButton: backButton)) {
                                                ShortArticleCard(articleData: articleViewModel.articles[pos], buttonText: Prompt.Button.chat)
                                            }
                                        }
                                    }
                                }
                                
                                Spacer()
                            }
                            
                            
                        }
                    }
                    
                    Spacer()
                }
            }
            .background(AppBackground()
                .blur(radius: searchBarValue.isEmpty ? 0 : 10))
            .navigationBarHidden(true)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            //            .edgesIgnoringSafeArea(.bottom)
            
        }
    }
}

struct ArticleMainPage_Previews: PreviewProvider {
    
    static var previews: some View {
        ArticleMainPageView(backButton: {})
            .environmentObject(parenthingsViewModel())
    }
    
}
