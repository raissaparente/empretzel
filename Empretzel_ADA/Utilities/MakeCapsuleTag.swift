//
//  MakeCapsuleTag.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 16/11/23.
//

import SwiftUI

struct MakeCapsuleTag: View {
    var text: String
    var textColor: Color
    var borderColor: Color
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundStyle(textColor)
                .font(.system(size: 13))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background {
            Capsule(style: .circular)
                .strokeBorder(borderColor, lineWidth: 0.8)
                .background(Capsule().fill(borderColor.opacity(0.2)))
        }
    }
}
