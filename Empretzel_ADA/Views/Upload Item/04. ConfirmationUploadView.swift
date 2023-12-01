//
//  04. ConfirmationUploadView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 16/11/23.
//

import SwiftUI
import SwiftData

struct ConfirmationUploadView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var displayUploadItemView: Bool
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Item Adicionado!")
                .font(.largeTitle)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        displayUploadItemView = false
                    }
                }
            
            
            Image("logopurple")
                .resizable()
                .frame(width: 90, height: 90)
            
            Spacer()
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .toolbar {
            Button("Fechar") {
               dismiss()
            }
        }
    }
}
