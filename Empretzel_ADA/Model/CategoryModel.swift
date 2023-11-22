//
//  CategoryModel.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 06/11/23.
//

import Foundation
import SwiftUI

enum Category: String, Codable, CaseIterable {
    case clothes
    case books
    case tools
    case tech
    case entertainment
    case other
    
    var color: Color {
       switch self {
       case .clothes:
           return .clothesorange
       case .books:
           return .bookpurple
       case .tools:
           return .toolgreen
       case .tech:
           return .techblue
       case .entertainment:
           return .entertainmentred
       case .other:
           return .othergray
       }
   }
    
    var name: String {
       switch self {
       case .clothes:
           return "Vestimentas"
       case .books:
           return "Livro"
       case .tools:
           return "Ferramenta"
       case .tech:
           return "Tecnologia"
       case .entertainment:
           return "Lazer"
       case .other:
           return "Outro"
       }
   }
    
    var icon: String {
       switch self {
       case .clothes:
           return "clothesicon"
       case .books:
           return "bookicon"
       case .tools:
           return "toolicon"
       case .tech:
           return "techicon"
       case .entertainment:
           return "entertainmenticon"
       case .other:
           return "othericon"
       }
   }
    
    var picture: String {
       switch self {
       case .clothes:
           return "clothespic"
       case .books:
           return "bookpic"
       case .tools:
           return "toolpic"
       case .tech:
           return "techpic"
       case .entertainment:
           return "entertainmentpic"
       case .other:
           return "otherpic"
       }
   }
}

