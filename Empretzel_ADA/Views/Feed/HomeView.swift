//
//  TEMPFeedView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//
import SwiftUI
import SwiftData

struct HomeView: View {
    @Query var items: [Item]
    @Environment(\.modelContext) var context
    
    @State var displayUploadItemView: Bool = false
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    FeedView(filterText: searchText)
                } header: {
                    ScrollView(.horizontal, showsIndicators: false) {
                        CategoryFilterView()
                    }
                    .headerProminence(.increased)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationTitle("Encontre Itens")
            .toolbar {
                Button {
                    displayUploadItemView = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.accent)
                        .font(.system(size: 30))
                }
            }
            .searchable(text: $searchText, prompt: "Qual item está procurando?")
            .overlay {
                if !searchText.isEmpty {
                    if items.isEmpty || !items.contains(where: { $0.name.lowercased().contains(searchText.lowercased()) }) {
                       
                        VStack {
                            // Display a custom image when the searched item is not found
                            Image(systemName: "exclamationmark.triangle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)
                            
                            Text("Item não encontrado. Tente novamente.")
                                .foregroundColor(.secondary)
                            
                        }
                        
                    }
                } else if items.isEmpty {
                    VStack {
                        // Display a message when no items are searched
                        Label("Por enquanto não há itens.", systemImage: "square.stack.3d.up.slash.fill")
                            .font(.title)
                            .foregroundColor(.secondary)
                        
                        Text("Tente adicionar um item ou procurar um amigo.")
                            .foregroundColor(.secondary)
                    }
                }
            }
            //modal de publicar item
            .sheet(isPresented: $displayUploadItemView) {
                CategoryUploadView(displayUploadItemView: $displayUploadItemView)
            }
            
        }
        .onAppear {
            context.insert(CurrentUserManager.currentUser)
        }
    }
}


