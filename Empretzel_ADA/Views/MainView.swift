//
//  MainView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 13/11/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MyItemsView()
                .tabItem {
                    Label("Itens", systemImage: "shippingbox.fill")
                }
            
            HomeView()
                .tabItem {
                    Label("Feed", systemImage: "house.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person.fill")
                }
        }
    }
}

