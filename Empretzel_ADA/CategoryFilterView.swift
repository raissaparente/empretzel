//
//  CategoryFilterView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 13/11/23.
//

import SwiftUI

struct CategoryFilterView: View {
    @State var searchText: String
    
    var body: some View {
        HStack {
            Button {
                searchText = ""
            } label: {
                Label("Todos", systemImage: "line.3.horizontal.decrease.circle.fill")
            }
            .buttonStyle(.borderedProminent)
            
            ForEach(Category.allCases, id: \.self) { category in
                Button {
                    searchText = category.name
                } label: {
                    Text(category.name)
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}
