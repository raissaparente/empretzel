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
        VStack {
            Image(item.category.picture)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: 90)
                .aspectRatio(contentMode: .fit)
            
            Text(item.name)
        }
        .padding()
        .frame(width: 113, height: 180)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(uiColor: .systemGroupedBackground))
        }
    }
}

