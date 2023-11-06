//
//  CategoryModel.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 06/11/23.
//

import Foundation
import SwiftUI

enum Category: String, Codable {
    case clothes
    case books
    case tools
    case tech
    case entertainment
    case other
    
    var color: Color {
           switch self {
           case .clothes:
               return .blue
           case .books:
               return .green
           case .tools:
               return .red
           case .tech:
               return .purple
           case .entertainment:
               return .orange
           case .other:
               return .gray
           }
       }
}


func nameForCategory(category: Category) -> String {
    switch category {
        case .clothes:
            return "Roupa"
        case .books:
            return "Livro"
        case .tools:
            return "Ferramenta"
        case .tech:
            return "Tecnologia"
        case .entertainment:
            return "Entretenimento"
        case .other:
            return "Outro"
    }
}
