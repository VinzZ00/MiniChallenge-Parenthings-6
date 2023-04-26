////
////  TestingScrollView.swift
////  MiniChallenge-Parenthings-6
////
////  Created by Elvin Sestomi on 26/04/23.
////
//
//import SwiftUI
//
//struct TestingScrollView: View {
//
//    private let cards : [View]
//    private let moduloCard : Int;
//    private let fullSlide : Int
//    
//    init(content : [View]) {
//        self.cards = content;
//        self.fullSlide = cards.count/4
//        self.moduloCard = cards.count%4;
//
//    }
//    
//    var body : some View {
//        ScrollViewReader {scrollIndexPage in
//            HStack{
//                ForEach(1...fullSlide, id: \.self) {slide in
//                    var index = 0;
//                    VStack{
//                        HStack {
//                            cards[index + (slide*3) - 3]()
//                            Spacer()
//                            cards[index+(slide*3) - 2]()
//                        }
//                        HStack{
//                            cards[index+(slide*3) - 1]()
//                            Spacer()
//                            cards[index+(slide*3) - 0]()
//                        }
//                    }.tag("slide\(slide)")
//                }
//                
//                if moduloCard != 0 {
//                    if moduloCard <= 2 {
//                        HStack{
//                            cards[cards.count-moduloCard]
////
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct TestingScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestingScrollView()
//    }
//}
