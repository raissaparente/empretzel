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
            
            VStack {
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
                                    .frame(width: 90, height: 90)
                                    .overlay {
                                        if categoryClicked != category {
                                            Circle()
                                                .fill(.white.opacity(0.5))
                                        }
                                    }


                                
                                Text(category.name)
                                    .font(.system(size: 18))
                                    .lineLimit(1)

                            }
                            .padding(.top)
                        }
                    }
                }
                .padding(20)
                
                Spacer()
                
                NavigationLink(destination: NameUploadView(item: item, displayUploadItemView: $displayUploadItemView)) {
                    MakeButtonLink(text: "Próximo")
                }
                .disabled(categoryClicked == nil)
            }
            .navigationTitle("Categoria")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(uiColor: .systemGroupedBackground))

        }
    }
}
