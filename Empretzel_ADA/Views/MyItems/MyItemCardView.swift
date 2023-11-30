//
//  MyItemCardView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 22/11/23.
//

import SwiftUI

struct MyItemCardView: View {
    var item: Item
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(item.category.picture)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .aspectRatio(contentMode: .fit)
            
            Text(item.name)
                .fontWeight(.semibold)
                .lineLimit(2)
            
            Spacer()
        }
        .padding(.horizontal, 7)
        .padding(.vertical)
        .frame(width: 115, height: 180)
        .background {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(uiColor: .systemGroupedBackground))
        }
    }
}

