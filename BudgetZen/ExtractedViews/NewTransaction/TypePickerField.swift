//
//  PickerField.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct TypePickerField: View {
    
    @Binding var entry : String
    
    var isValid : Bool
    
    var type : Transaction.TransactionType? {
        Transaction.TransactionType.allCases.first(where: { $0.rawValue == entry })
    }
    
    var colors : (foreground: Color, shadow: Color) {
        if let selectedType = type {
                return (foreground: selectedType.getTypeStyle().foreground, shadow: selectedType.getTypeStyle().shadow)
        } else {
            return (foreground: .balanceText, shadow: .balance)
        }
    }
    
    var filling : Color {
        if let selectedType = type {
            return selectedType.getTypeStyle().background
        } else {
            return .balanceBg
        }
    }
    
    var body: some View {
        
        FieldStyle(fieldBorder: colors.shadow, title: "Type", charLimit: 0, errorMessage: "Veuillez choisir le type de la transaction", isValid: isValid){ limit in
            
            HStack(spacing: -4){
                Image(systemName: type != nil ? type!.getTypeIcon() : "")
                    .font(.none)
                    .mainInfoStyle(infoColorSet: colors)
                
                Picker("Type",selection: $entry) {
                    Text("Choisir un type")
                        .tag("Choix")
                    ForEach(Transaction.TransactionType.allCases, id: \.self){ type in
                        
                        Text(type.rawValue)
                            .tag(type.rawValue)
                        
                    }
                }
            }
            .pickerStyle(.menu)
            .tint(colors.foreground)
            .frame(maxWidth: .infinity)
            .background{
                Capsule()
                    .fill(filling)
            }
        }
    }
}

#Preview {
    TypePickerField(entry: .constant("Choix"), isValid: false)
}
