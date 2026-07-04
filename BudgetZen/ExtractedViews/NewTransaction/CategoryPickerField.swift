//
//  PickerField.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct CategoryPickerField: View {
    
    @State private var entry : String = "Choix"
    var category : Transaction.Category? {
        Transaction.Category.allCases.first(where: {$0.rawValue == entry })
    }
    
    var colors : (foreground: Color, shadow: Color) {
        return (foreground: .balanceText, shadow: .balance)
    }
    
    var body: some View {
        
        FieldStyle(fieldBorder: colors.shadow, title: "Catégorie de la transaction", charLimit: 20, errorMessage: "Vous n'avez pas renseigné de montant"){ limit in
            
            HStack(spacing: -4){
                Image(systemName: category != nil ? category!.getCategoryIcon() : "")
                    .font(.none)
                    .mainInfoStyle(infoColorSet: colors)
                
                Picker("Catégorie", selection: $entry) {
                    
                    Text("Choisir une catégorie")
                        .tag("Choix")
                    ForEach(Transaction.Category.allCases, id: \.self){ category in
                        
                        Text(category.rawValue)
                            .tag(category.rawValue)
                    }
                }
            }
            .pickerStyle(.menu)
            .tint(colors.foreground)
            .frame(maxWidth: .infinity)
            .background{
                Capsule()
                    .fill(.balanceBg)
            }
        }
    }
}


#Preview {
    CategoryPickerField()
}
