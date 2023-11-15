//
//  CardView.swift
//  Empretzel_ADA
//
//  Created by Mariana Moura de Barros on 15/11/23.
//

import SwiftUI

struct CardView: View {
    
    var categoryName: String = "Entretenimento"
    var categoryColor: Color
    var itemName: String = "Jogo de tabuleiro"
    var itemDetails: String = "Jogo dixit ótimo estado faltando 2 cartas"
    var itemImage: String = Category.other.icon
    
    var body: some View {
        
        VStack {
            VStack{
                //******************Primeiro card***********************
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.white)
                        .frame(width: .infinity, height: 125)
                    
                    HStack{
                        Image(itemImage)
                        Spacer()
                        VStack(alignment: .leading ){
                            MakeCapsuleTag(text: categoryName.uppercased(), textColor: categoryColor, borderColor: categoryColor)
//                            Text(categoryName.uppercased())
//                                .foregroundColor(categoryColor)
//                                .bold()
                            Text(itemName)
                                .font(.title2.bold())
                            Text(itemDetails)
                        }
                    }
                    .padding()
                }
                .padding()
                
            }
        }
    }
}


