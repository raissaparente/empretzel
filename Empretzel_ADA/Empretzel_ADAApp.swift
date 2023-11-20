//
//  Empretzel_ADAApp.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//

import SwiftUI
import SwiftData

@main
struct Empretzel_ADAApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [Item.self, User.self])
    }
}
