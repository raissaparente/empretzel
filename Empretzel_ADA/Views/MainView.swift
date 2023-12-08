//
//  MainView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 13/11/23.
//

import SwiftUI

struct MainView: View {
    
    enum Tab: Hashable {
        case items
        case feed
        case profile

        var id: Self { self }
    }

    @State private var tab = Tab.feed
    
    var body: some View {
        
        TabView(selection: $tab) {
            MyItemsView()
                .tabItem {
                    Label("Itens", systemImage: "shippingbox.fill")
                }
                .tag(Tab.items)
            
            HomeView()
                .tabItem {
                    Label("Feed", systemImage: "house.fill")
                }
                .tag(Tab.feed)
            
            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person.fill")
                }
                .tag(Tab.profile)
        }
    }
}

