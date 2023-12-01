//
//  MyItemsSectionView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 30/11/23.
//

import SwiftUI

struct MyItemsSectionView: View {
    var title: String
    var itemArray: [Item]
    var tagCondition: Bool?
    var trueConditionColor: Color
    var falseConditionColor: Color
    
    @State var selectedItem: Item?
    var modalViewBorrow: Bool
    
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
            
            ScrollView (.horizontal, showsIndicators: false){
                HStack {
                    ForEach(itemArray) {item in
                        ZStack(alignment: .topLeading) {
                            
                            Button {
                                selectedItem = item
                                print("foi")
                            } label: {
                                MyItemCardView(item: item)
                                    .padding(.top, 5)
                            }
                            
                            Image(systemName: "bookmark.fill")
                                .font(.system(size: 32))
                                .foregroundStyle(item.isAccepted ? trueConditionColor : falseConditionColor)
                                .padding(.leading, 10)
                        }
                    }
                    .sheet(item: $selectedItem) { item in
                        if modalViewBorrow {
                            BorrowedItemsView(item: item)
                        } else {
                            LentItemsView(item: item)
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 250)
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color(uiColor: .secondarySystemGroupedBackground))
            }
        }
    }
}
