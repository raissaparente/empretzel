//
//  CategoryFilterView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 13/11/23.
//

import SwiftUI

struct CategoryFilterView: View {
    @State var categoryPicked: Category?
    @State var allPicked: Bool = true
    
    var body: some View {
        HStack {
            if allPicked == true {
                Button {
                    allPicked = true
                    categoryPicked = nil
                } label: {
                    Label("Todos", systemImage: "line.3.horizontal.decrease.circle.fill")
                }
                .foregroundStyle(.teste)
                .buttonStyle(.borderedProminent)
            } else {
                Button {
                    allPicked = true
                    categoryPicked = nil
                } label: {
                    Label("Todos", systemImage: "line.3.horizontal.decrease.circle.fill")
                }
                .buttonStyle(.bordered)
            }

            
            ForEach(Category.allCases, id: \.self) { category in
                if categoryPicked == category {
                    Button {
                        allPicked = false
                        categoryPicked = category
                    } label: {
                        Text(category.name)
                    }
                    .foregroundStyle(.teste)
                    .buttonStyle(.borderedProminent)
                } else {
                    Button {
                        allPicked = false
                        categoryPicked = category
                    } label: {
                        Text(category.name)
                    }
                    .buttonStyle(.bordered)
                }
            }
            
        }
        .padding()
    }
}
