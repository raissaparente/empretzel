//
//  03. PictureUploadView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 16/11/23.
//

import SwiftUI
import SwiftData

struct PictureUploadView: View {
    @Environment(\.modelContext) var context
    var item: Item
    
    @Binding var displayUploadItemView: Bool
    @State var isNavigationActive = false
    
    var body: some View {
        NavigationStack {
            
            VStack (spacing: 30) {
                Image("pictureicon")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text("Selecione uma foto")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                Image(systemName: "camera")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 300)
                    .background(.gray.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Spacer()
                
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
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationDestination(isPresented: $isNavigationActive) {
                ConfirmationUploadView(displayUploadItemView: $displayUploadItemView)
            }
        }
    }
    
    func addItem(item: Item) {
        context.insert(item)
    }
    
}
