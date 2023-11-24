//
//  CardView.swift
//  Empretzel_ADA
//
//  Created by Mariana Moura de Barros on 15/11/23.
//

import SwiftUI

struct CardView: View {
    
    var categoryName: String
    var categoryColor: Color
    var itemName: String
    var itemDetails: String
    var itemImage: String
    
    
//    RoundedRectangle(cornerRadius: 20, style: .continuous)
//        .fill(.white)
//        .frame(maxWidth: .infinity, maxHeight: 125)
    
    var body: some View {
        HStack(alignment: .top) {
            
            Image(itemImage)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: 135, height: 115)
                    
            VStack(alignment: .leading){
                HStack {
                    MakeCapsuleTag(text: categoryName.uppercased(), textColor: categoryColor, borderColor: categoryColor)
                    Spacer()
                }
                
                Text(itemName)
                    .font(.system(size: 18).bold())
                Text(itemDetails)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                            
            }
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(uiColor: .secondarySystemGroupedBackground))
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

    
#Preview(traits: .sizeThatFitsLayout) {
    CardView(categoryName: "LIVRO", categoryColor: .purple, itemName: "Chav de fenda", itemDetails: "Livro super interessante sobre formação de hábitos", itemImage: "clothespic")
        .background(.black)
}


