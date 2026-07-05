//
//  PickerField.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct CategoryPickerField: View {
    
    @Binding var entry : String
    
    var isValid : Bool
    
    var category : Transaction.Category? {
        Transaction.Category.allCases.first(where: {$0.rawValue == entry })
    }
    
    var colors : (foreground: Color, shadow: Color) {
        return (foreground: .balanceText, shadow: .balance)
    }
    
    var body: some View {
        
        FieldStyle(fieldBorder: colors.shadow, title: "Catégorie", charLimit: 0, errorMessage: "Veuillez choisir la catégorie de la transaction", isValid: isValid){ limit in
            
            HStack(spacing: -4){
                Image(systemName: category != nil ? category!.getCategoryIcon() : "")
                    .font(.none)
                    .mainInfoStyle(infoColorSet: colors)
                
                Picker("Catégorie", selection: $entry) {
                    
                    Text("Choisir une catégorie")
                        .tag("")
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
    CategoryPickerField(entry: .constant("Choix"), isValid: false)
}
