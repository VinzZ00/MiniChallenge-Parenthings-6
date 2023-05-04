//
//  ArticleDetailView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation
import SwiftUI

struct ArticleDetailView: View {
    
    @State var searchBarValue : String = "3";
    @EnvironmentObject var viewModel : parenthingsViewModel
    
    var backButton : () -> Void;
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                CustomNavigationBar(title: Prompt.Title.articles, enableBackButton: false, defaultTextSearchBar: Prompt.searchBar.articlesPage, searchText: $searchBarValue, enableSearchBar: false, backButton: self.backButton)
                
                VStack {
                        ScrollView(.vertical) {
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Text("#Depresi")
                                        .font(.system(size: 13, weight: .regular))
                                        .foregroundColor(AppColor.textCyanColor)
                                    Text("•")  .foregroundColor(AppColor.expertTextGrayColor)
                                    Text("Sabtu, 15 April 2023, 22.00 WIB")
                                        .font(.system(size: 13, weight: .regular))  .foregroundColor(AppColor.expertTextGrayColor)
                                    Spacer()
                                }
                                
                               
                                Image(uiImage: UIImage(named: "ParentingPlaceHolder")!)
                                    .resizable()
                                    .aspectRatio(16/9,contentMode: .fit)
                                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
                                        .mask {
                                            RoundedRectangle(cornerRadius: 15)
                                        }
                                      
                                
                                HStack{
                                    Text("By")
                                        .font(.system(size: 17, weight: .regular))
                                    Text("Peter Parker ")
                                        .font(.system(size: 17, weight: .bold))
                                    Image(systemName: "checkmark.seal.fill")
                                    Spacer()
                                }
                                Text(html:  "<p style=\"font-size:17\"><b>Lorem ipsum dolor sit amet</b>, consectetur adipiscing elit. Sed scelerisque faucibus dui, ac pharetra dolor luctus et. Sed suscipit risus et enim lacinia, at efficitur tortor ornare. Etiam vel condimentum quam. Praesent faucibus metus augue, sit amet pellentesque elit varius at. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse vestibulum metus at libero hendrerit, nec venenatis sapien mattis. Praesent et arcu sit amet justo gravida eleifend quis non dui. Quisque tempus, massa posuere rutrum consectetur, diam metus consectetur purus, non mattis massa magna ut nibh.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed scelerisque faucibus dui, ac pharetra dolor luctus et. Sed suscipit risus et enim lacinia, at efficitur tortor ornare. Etiam vel condimentum quam. Praesent faucibus metus augue, sit amet pellentesque elit varius at. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse vestibulum metus at libero hendrerit, nec venenatis sapien mattis.\nPraesent et arcu sit amet justo gravida eleifend quis non dui. Quisque tempus, massa posuere rutrum consectetur, diam metus consectetur purus, non mattis massa magna ut nibh.</h1>")

                                    .padding(.top, 8)

                                
                                Spacer()
                            }
                            
                        }
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    
                    Spacer()
                }
            }
            .background(AppBackground())
            .navigationBarHidden(true)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .edgesIgnoringSafeArea(.bottom)

        }
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        ArticleDetailView(backButton: {})
            .environmentObject(parenthingsViewModel())
    }
    
}
