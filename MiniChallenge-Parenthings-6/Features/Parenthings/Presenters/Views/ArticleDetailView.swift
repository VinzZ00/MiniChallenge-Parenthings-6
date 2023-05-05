//
//  ArticleDetailView.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 04/05/23.
//

import Foundation
import SwiftUI

struct ArticleDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var article : ArticleModel
    @State var searchBarValue : String = "";

    var backButton : () -> Void
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 0){
                Button(action: {
                    //                        backButton();
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack (alignment: .center) {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .frame(width: 23, height: 34)
                            .font(.system(size: 28, weight: .bold))
                        Text("Articles")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                            .frame(height: 34)
                    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))

                }
                .frame(height: 100)
                
                VStack(alignment: .leading) {
                        ScrollView(.vertical) {
                            
                            VStack(alignment: .leading){
                                Text(article.title)
                                    .font(.system(size: 22,weight: .bold))
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(height: 30)
                                    .padding(EdgeInsets(top: 24, leading: 0, bottom: 4, trailing: 0))
                                HStack{
                                    Text(article.tag)
                                        .font(.system(size: 13, weight: .regular))
                                        .foregroundColor(AppColor.textCyanColor)
                                    Text("•")  .foregroundColor(AppColor.expertTextGrayColor)
                                    Text("Sabtu, 15 April 2023, 22.00 WIB")
                                        .font(.system(size: 13, weight: .regular))  .foregroundColor(AppColor.expertTextGrayColor)
                                    Spacer()
                                }
                                
                               
                                Image(uiImage: UIImage(named:  article.image ?? "ParentingPlaceHolder")!)
                                    .resizable()
                                    .aspectRatio(16/9,contentMode: .fit)
                                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
                                        .mask {
                                            RoundedRectangle(cornerRadius: 15)
                                        }
                                      
                                HStack{
                                    Text("By")
                                        .font(.system(size: 17, weight: .regular))
                                    Text(article.author)
                                        .font(.system(size: 17, weight: .bold))
                                    Image(systemName: "checkmark.seal.fill")
                                    Spacer()
                                }
                                Text(html:  article.article)
                                    .padding(.top, 8)
                                
                                Spacer()
                            }
                            
                        }
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    
                    Spacer()
                }
            }
            .background(AppBackground())
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .edgesIgnoringSafeArea(.bottom)

        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)

    }
}

struct ArticleDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        ArticleDetailView(article: ArticleModel().sampleData(), backButton: {})
            .environmentObject(parenthingsViewModel())
    }
    
}
