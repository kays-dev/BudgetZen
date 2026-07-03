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
    
    var isIncome : Bool = true
    
    var body: some View {
        FieldStyle(fieldBorder: .balance, title: "Montant", charLimit: 20, errorMessage: "Vous n'avez pas renseigné de montant"){ limit in
            
            HStack{
                Image(systemName: isIncome ? "plus" : "minus")
                    .symbolVariant(.circle.fill)
                
                TextField("Montant de la transaction", text: $entry, axis: .horizontal)
                    .keyboardType(.decimalPad)
                    .onChange(of: entry, {
                        
                        entry = String(entry.prefix(limit))
                        
                        number = validAmountQuery(entry, number)
                        
                    })
                
                Image(systemName: "eurosign")
                    .font(.footnote)
                
            }
        }
    }
}

#Preview {
    AmountField()
}
