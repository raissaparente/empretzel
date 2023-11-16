//
//  04. ConfirmationUploadView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 16/11/23.
//

import SwiftUI
import SwiftData

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
