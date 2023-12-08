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
        
        ZStack{
            Color(uiColor: .systemGroupedBackground)
              .edgesIgnoringSafeArea(.all)
              .clipShape(RoundedRectangle(cornerRadius: 16))
              .padding(16)
              
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
           

        
         
           
            .toolbar {
                Button("Fechar") {
                    dismiss()
                }
            }
            
        }
        

    }
       
}


struct ConfirmationUploadView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ConfirmationUploadView(displayUploadItemView: .constant(true))
        }
    }
}
