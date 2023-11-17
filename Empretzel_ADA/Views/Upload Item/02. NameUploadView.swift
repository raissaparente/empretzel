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
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text("Preencha os dados")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    Form {
                        Section {
                            TextField("Titulo do seu anúncio", text: $item.name)
                        } header: {
                            Text("Nome")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundStyle(.darkgray)
                                .textCase(nil)
                        }
                        
                        Section {
                            TextField("Descreva o seu item.\nEx.: Jogo Dixit, ótimo estado, apenas faltando 2 cartas", text: $item.details, axis: .vertical)
                                .lineLimit(5...10)
                        } header: {
                            Text("Descrição")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundStyle(.darkgray)
                                .textCase(nil)
                        }
                        
                        Section {
                            Picker("Estado", selection: $item.state) {
                                Text("Danificado").tag(1)
                                Text("Bom estado").tag(2)
                                Text("Excelente").tag(3)
                            }
                        } header: {
                            Text("Estado do item")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundStyle(.darkgray)
                                .textCase(nil)
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Spacer()

                    NavigationLink(destination: PictureUploadView(item: item, displayUploadItemView: $displayUploadItemView)) {
                        MakeButtonLink(text: "Próximo")
                    }
                    .disabled (
                        item.name.isEmpty
                        || item.details.isEmpty
                        || item.state == 0
                    )
                }
                .padding()
                .navigationTitle("Descrição")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
