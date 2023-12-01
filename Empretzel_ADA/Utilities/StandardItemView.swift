//
//  StandardItemView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 30/11/23.
//

import SwiftUI
import SwiftData

struct StandardItemView: View {
    var item: Item
    
    @Query(filter: #Predicate<User> { user in
        user.id == 1
    }) var users: [User]
    
    var body: some View {
        VStack {
            Image(item.category.picture)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .aspectRatio(contentMode: .fit)
            
            Text(item.name)
                .font(.title2)
                .bold()
            
            MakeCapsuleTag(text: "Dono: \(users.first!.name)", textColor: item.category.color, borderColor: item.category.color)
            
            //Descricao
            VStack {
                Text(item.details)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
            .background(Color(uiColor: .systemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            //Tags
            HStack {
                MakeCapsuleTag(text: item.category.name.uppercased(), textColor: item.category.color, borderColor: item.category.color)
                MakeCapsuleTag(text: stateString(state: item.state).uppercased(), textColor: item.category.color, borderColor: item.category.color)
            }
        }
        
    }
    
    func stateString(state: Int) -> String{
        if state == 1 {
            return "Danificado"
        } else if state == 3 {
            return "Excelente"
        } else {
            return "Bom estado"
        }
    }
}
