//
//  02. NameUploadView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 16/11/23.
//

import SwiftUI
import SwiftData

struct NameUploadView: View {
    @Bindable var item: Item
    @Binding var displayUploadItemView: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightgray
                    .ignoresSafeArea()
                
                VStack {
                    
                    Image("writeicon")
                    Text("Preencha os dados")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    Form {
                        Section(header: Text("Nome")) {
                            TextField("Titulo do seu anúncio", text: $item.name)
                            
                        }
                        
                        Section(header: Text("Descrição")) {
                            TextField("Descreva o seu item.\nEx.: Jogo Dixit, ótimo estado, apenas faltando 2 cartas", text: $item.details, axis: .vertical)
                                .lineLimit(5...10)
                        }
                    }
                    
                    Spacer()

                    NavigationLink(destination: PictureUploadView(item: item, displayUploadItemView: $displayUploadItemView)) {
                        MakeButtonLink(text: "Próximo")
                    }
                }
                .padding()
                .navigationTitle("Descrição")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
