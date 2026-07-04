//
//  AmountField.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct AmountField: View {
    @State private var entry : String = ""
    @State private var number : Double = 0.00
    
    var colors : (foreground: Color, shadow: Color) {
        isIncome ? (foreground: Transaction.TransactionType.income.getTypeStyle().foreground, shadow: Transaction.TransactionType.income.getTypeStyle().shadow) : (foreground: Transaction.TransactionType.expense.getTypeStyle().foreground, shadow: Transaction.TransactionType.expense.getTypeStyle().shadow)
    }
    
    var isIncome : Bool = true
    
    @Binding var isValid : Bool
    
    var body: some View {
        FieldStyle(fieldBorder: isIncome ? Transaction.TransactionType.income.getTypeStyle().border : Transaction.TransactionType.expense.getTypeStyle().border, title: "Montant de la transaction", charLimit: 20, errorMessage: "Vous n'avez pas renseigné de montant", content : { limit in
            
            HStack{
                Image(systemName: isIncome ? "plus" : "minus")
                    .symbolVariant(.circle.fill)
                    .mainInfoStyle(infoColorSet: (foreground: colors.foreground, shadow: colors.shadow))
                
                TextField("0,00", text: $entry, axis: .horizontal)
                    .keyboardType(.decimalPad)
                    .onChange(of: entry, {
                        
                        entry = String(entry.prefix(limit))
                        
                        number = validAmountQuery(entry, number)
                        
                    })
                
                Image(systemName: "eurosign")
                    .font(.headline)
                
            }
        })
    }
}

#Preview {
    AmountField(isValid: .constant(true))
}
