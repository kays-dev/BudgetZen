//
//  AmountField.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct AmountField: View {
    @Binding var entry : String
    @Binding var number : Double

    var isIncome : Bool?
    var type : Transaction.TransactionType? {
        if isIncome != nil {
            return isIncome! ? Transaction.TransactionType.income : Transaction.TransactionType.expense
        } else {
            return nil
        }
    }
    
    var colors : (foreground: Color, shadow: Color) {
        if let selectedType = type {
                return (foreground: selectedType.getTypeStyle().foreground, shadow: selectedType.getTypeStyle().shadow)
        } else {
            return (foreground: .balanceText, shadow: .balance)
        }
    }
    
    var isValid : Bool
    
    var body: some View {
        FieldStyle(fieldBorder: isIncome != nil ? type!.getTypeStyle().border : .balance, title: "Montant", charLimit: 20, errorMessage: "Veuillez renseigner le montant de la transaction", isValid: isValid){ limit in
            
            HStack{
                Image(systemName: isIncome != nil ? type!.getTypeOperator() : "pencil")
                    .symbolVariant(.circle.fill)
                    .font(.none)
                    .mainInfoStyle(infoColorSet: colors)
                
                TextField("0,00", text: $entry, axis: .horizontal)
                    .keyboardType(.decimalPad)
                    .onChange(of: entry, {
                        
                        entry = String(entry.prefix(limit))
                        
                        if entry.count(where: { $0 == "," }) > 1 {
                            if let overflow = entry.lastIndex(of: ",") {
                                entry.remove(at: overflow)
                            }
                        }
                    
                        number = Double(entry.replacingOccurrences(of: ",", with: ".")) ?? number
                        
                    })
                
                Image(systemName: "eurosign")
                    .font(.none)

            }
        }
    }
}

#Preview {
    AmountField(entry: .constant(""), number: .constant(0.00), isIncome: nil, isValid: false)
}
