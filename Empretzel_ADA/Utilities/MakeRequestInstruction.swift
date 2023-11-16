//
//  MakeRequestInstruction.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 16/11/23.
//

import SwiftUI

struct MakeRequestInstruction: View {
    var number: String
    var text: String
    
    var body: some View {
        HStack {
            Text(number)
                .bold()
                .padding(5)
                .foregroundStyle(.white)
                .background(Circle().fill(.accent))
            Text(text)
                .italic()
        }
    }
}
