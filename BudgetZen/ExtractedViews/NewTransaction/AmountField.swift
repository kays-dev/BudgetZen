//
//  AmountField.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct AmountField: View {
    @State private var amount : Double = 0.00
    var isIncome : Bool = true
    
    var body: some View {
        FieldStyle(fieldBorder: .balance, charLimit: 45, errorMessage: "Vous n'avez pas renseigné de montant"){ limit in
            HStack{
                
                Image(systemName: isIncome ? "plus" : "minus")
                    .symbolVariant(.circle.fill)
                
                TextField("Renseignez le montant de la transaction", value: $amount, format: .number.precision(.fractionLength(2)))
                    .onChange(of: amount, {
                        if String(amount).count > limit {
                            amount = Double(String(amount).dropLast()) ?? amount
                        }
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
