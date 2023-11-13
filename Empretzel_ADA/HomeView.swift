//
//  TEMPFeedView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//

import SwiftUI
import SwiftData

struct TempFeedView: View {
    @Query var items: [Item]
 
    @State var displayUploadItemView: Bool = false
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView (.horizontal, showsIndicators: false){
                CategoryFilterView(searchText: searchText)
            }

            ScrollView {
                FeedView(filterText: searchText)
                }
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
    
