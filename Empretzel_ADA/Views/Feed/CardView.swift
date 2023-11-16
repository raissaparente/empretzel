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
    var maxCharacter: Int = 30
    
    var body: some View {
        
        VStack {
            VStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.white)
                        .frame(maxWidth: .infinity, maxHeight: 125)
                    
                    HStack{
                        
                        Image(itemImage)
                            .resizable()
                            .frame(width: 120, height: 100)
                            .padding()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                       
                        VStack(alignment: .leading){
                            HStack {
                                MakeCapsuleTag(text: categoryName.uppercased(), textColor: categoryColor, borderColor: categoryColor)
                                Spacer()
                            }

                            
                            Text(itemName)
                                .font(.title2.bold())
                            Text(
                                String(itemDetails.prefix(maxCharacter)) + (itemDetails.count > maxCharacter ? "..." : "")
                            )
                                
                                                        
                        }
                        .padding()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 5)
                }
                .padding(.horizontal, 16)
            }
        }
    }
}


    

