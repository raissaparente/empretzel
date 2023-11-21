//
//  MyItemsView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 13/11/23.
//

import SwiftUI
import SwiftData

struct MyItemsView: View {
    
    var body: some View {
        VStack {
            Text(CurrentUserManager.currentUser.name)
                .font(.largeTitle)
            
            List {
                ForEach(CurrentUserManager.currentUser.borrowedItems) {item in
                    VStack {
                        Image(item.category.picture)
                        Text(item.name)
                    }
                }
            }
        }
        

 
    }
}
