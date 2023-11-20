//
//  01. CategoryUploadView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 16/11/23.
//

import SwiftData
import SwiftUI

struct CategoryUploadView: View {
    
    @Bindable var item = Item()
    @Binding var displayUploadItemView: Bool
    @State var categoryClicked: Category?
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack {
            
            Image("categoryicon")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("Escolha a categoria")
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            LazyVGrid(columns: columns) {
                ForEach(Category.allCases, id: \.self) { category in
                    Button {
                        item.category = category
                        categoryClicked = category
                    } label: {
                        VStack {
                            Image(category.icon)
                                .resizable()
                                .frame(width: 70, height: 70)
                                .padding(10)
                                .overlay {
                                    if categoryClicked != category {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(.accent, lineWidth: 1)
                                            .fill(.white.opacity(0.4))
                                    } else {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(.accent, lineWidth: 2)
                                    }
                                }
                            
                            Text(category.name)
                        }
                    }
                }
            }
            .padding(30)
            
            Spacer()
            
            NavigationLink(destination: NameUploadView(item: item, displayUploadItemView: $displayUploadItemView)) {
                MakeButtonLink(text: "Próximo")
            }
            .navigationTitle("Categoria")
            .navigationBarTitleDisplayMode(.inline)
            .disabled(categoryClicked == nil)
        }
    }
}
