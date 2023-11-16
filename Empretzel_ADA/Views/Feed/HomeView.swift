//
//  TEMPFeedView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query var items: [Item]
    
    @State var displayUploadItemView: Bool = false
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    FeedView(filterText: searchText)
                } header: {
                    ScrollView(.horizontal, showsIndicators: false) {
                        CategoryFilterView(searchText: searchText)
                    }
                    .headerProminence(.increased)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationTitle("Encontre Itens")
            .toolbar {
                Button {
                    displayUploadItemView = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.eggplantpurple)
                        .font(.system(size: 30))
                }
            }
            .searchable(text: $searchText, prompt: "Qual item está procurando?")
  

                //modal de publicar item
                .sheet(isPresented: $displayUploadItemView) {
                    CategoryUploadView(displayUploadItemView: $displayUploadItemView)
                }
            

        }
    }
}


