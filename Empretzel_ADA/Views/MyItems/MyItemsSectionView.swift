//
//  MyItemsSectionView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 30/11/23.
//

import SwiftUI
import SwiftData

struct MyItemsSectionView: View {
    var title: String
    var itemArray: [Item]
    var tagCondition: Bool?
    var trueConditionColor: Color
    var falseConditionColor: Color
    var emptyArrayText: String
    
    @State var selectedItem: Item?
    var modalViewBorrow: Bool
    
    @Query(filter: #Predicate<User> { user in
        user.isLoggedin == true
    }) var loggedUser: [User]
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
            
            if itemArray.isEmpty {
                Spacer()
                
                Text(emptyArrayText)
                    .foregroundStyle(.darkgray)
                
                Spacer()
                
            } else {
                ScrollView (.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(itemArray) {item in
                            ZStack(alignment: .topLeading) {
                                
                                Button {
                                    selectedItem = item
                                } label: {
                                    MyItemCardView(item: item)
                                        .padding(.top, 5)
                                }
                                
                                Image(systemName: "bookmark.fill")
                                    .font(.system(size: 32))
                                    .foregroundStyle(item.borrower == loggedUser.first ? trueConditionColor : falseConditionColor)
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
