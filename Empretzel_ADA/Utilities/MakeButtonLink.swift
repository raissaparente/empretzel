//
//  MakeButtonLink.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 16/11/23.
//

import SwiftUI

struct MakeButtonLink: View {
    let text: String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.title2)
                .foregroundStyle(.white)
        }
        .frame(width: 300, height: 50)
        .background(.accent)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

