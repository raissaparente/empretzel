//
//  RequestConfirmationView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 16/11/23.
//

import SwiftUI

struct ItemConfirmationView: View {
    let item: Item
    @Binding var displayRequestView: Bool
    
    var body: some View {
        
        ZStack {
            
            Color.lightgray
                .ignoresSafeArea()
            VStack {
                VStack (spacing: 40){
                    Image(item.category.picture)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(item.name)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.accent)
                    
                    
                    Text("Solicitação enviada!")
                        .font(.largeTitle)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                displayRequestView = false
                            }
                        }
                    
                    Image("logopurple")
                        .resizable()
                        .frame(width: 90, height: 90)
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 500)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
            .navigationTitle("Item")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
