//
//  TEMPUploadItemView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//

//Upload view path:
//CategoryUploadView >> NameUploadView >> PictureUploadView >> ConfirmationUploadView

import SwiftData
import SwiftUI

struct CategoryUploadView: View {
    @Bindable var item = Item()
    @Binding var displayUploadItemView: Bool
    @State var categoryClicked: Category?
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack {
            
            Image("categoryicon")
            Text("Escolha a categoria")
                .font(.largeTitle)
                .bold()
            
            LazyVGrid(columns: columns) {
                ForEach(Category.allCases, id: \.self) { category in
                    Button {
                        item.category = category
                        categoryClicked = category
                    } label: {
                        VStack {
                            Image(category.icon)
                                .resizable()
                                .frame(width: 70, height: 70)
                                .padding(10)
                                .overlay {
                                    if categoryClicked != category {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(.accent, lineWidth: 1)
                                            .fill(.white.opacity(0.4))
                                    } else {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(.accent, lineWidth: 2)
                                    }
                                }
                            
                            Text(category.name)
                        }
                    }
                }
            }
            .padding(30)
            
            NavigationLink(destination: NameUploadView(item: item, displayUploadItemView: $displayUploadItemView)) {
                MakeButtonLink(text: "Próximo")
            }
            .navigationTitle("Categoria")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



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
                    
                    
                    Form {
                        Section(header: Text("Nome")) {
                            TextField("Titulo do seu anúncio", text: $item.name)
                            
                        }
                        
                        Section(header: Text("Descrição")) {
                            TextField("Descreva o seu item.\nEx.: Jogo Dixit, ótimo estado, apenas faltando 2 cartas", text: $item.details, axis: .vertical)
                                .lineLimit(5...10)
                        }
                    }
                    
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

struct PictureUploadView: View {
    @Environment(\.modelContext) var context
    var item: Item
    @Binding var displayUploadItemView: Bool
    @State var isNavigationActive = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightgray
                    .ignoresSafeArea()
                
                VStack (spacing: 30) {
                    Image("pictureicon")
                    Text("Selecione uma foto")
                        .font(.largeTitle)
                        .bold()
                    
                    
                    Image(systemName: "camera")
                        .font(.system(size: 40))
                        .foregroundStyle(.white)
                        .frame(width: 300, height: 300)
                        .background(.gray.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    
                    Button {
                        addItem(item: item)
                        isNavigationActive = true
                    } label: {
                        Text("Publicar")
                            .padding(0)
                            .font(.title2)
                            .frame(width: 280, height: 40)
                    }
                    .buttonStyle(.borderedProminent)
                    
                }
                .padding(30)
                .navigationTitle("Imagem")
                .navigationBarTitleDisplayMode(.inline)
            }
            .navigationDestination(isPresented: $isNavigationActive) {
                ConfirmationUploadView(displayUploadItemView: $displayUploadItemView)
            }
        }
    }
    
    func addItem(item: Item) {
        context.insert(item)
    }
    
}

struct ConfirmationUploadView: View {
    @Binding var displayUploadItemView: Bool
    
    var body: some View {
        Text("Item Adicionado!")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    displayUploadItemView = false
                }
            }
    }
}


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

