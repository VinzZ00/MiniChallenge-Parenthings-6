//
//  ConsultationSearchPage.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 04/05/23.
//

import SwiftUI

struct ConsultationSearchPage: View {
    @EnvironmentObject var viewModel : parenthingsViewModel;
    @StateObject var expertViewModel : ExpertViewModel = ExpertViewModel();

    
    var body: some View {
        VStack {
            CustomNavigationBar(title: "Consultation", enableBackButton: true, defaultTextSearchBar: Prompt.searchBar.consultationMainPage, searchText: $viewModel.searchExpertBarValue, enableSearchBar: true, backButton: {
                withAnimation {
                    viewModel.textFieldIsClicked = false;
                }
            })
            ScrollView(.vertical) {
                VStack{
                    SearchPage(searchedExperts: expertViewModel.experts.filter{
                        $0.name.contains(viewModel.searchExpertBarValue)
                    })
                    
                }
            }
            Spacer();
        }
        .transition(.move(edge: .bottom))
        .background(AppBackground())
            
    }
}

struct ConsultationSearchPage_Previews: PreviewProvider {
    static var previews: some View {
        ConsultationSearchPage()
    }
}
