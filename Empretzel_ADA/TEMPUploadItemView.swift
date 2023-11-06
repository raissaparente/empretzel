//
//  TEMPUploadItemView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//

import Foundation


import SwiftUI

struct UploadItemView: View {
    @Bindable var item: Item
    
    var body: some View {
        Form {
            TextField("Nome", text: $item.name)
            TextField("Descrição", text: $item.details)
            
        }
        .navigationTitle("Publique um item")
        .navigationBarTitleDisplayMode(.inline)
    }
}
