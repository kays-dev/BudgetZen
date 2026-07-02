//
//  TransactionAmount.swift
//  BudgetZen
//
//  Created by Apprenant174 on 02/07/2026.
//

import SwiftUI

struct TransactionAmount: View {
    let transaction : Transaction
    let style : (foreground : Color, border : Color, background : Color, shadow : Color)
    
    var body: some View {
        HStack(spacing: 4){
            Image(systemName: transaction.type.getTypeOperator())
                .font(.footnote)
                .bold()
                .foregroundStyle(style.foreground)
            
            HStack(spacing: 0){
                Text("\(transaction.amount, specifier: "%.2f")")
                    .font(.title3)
                    .mainInfoStyle(infoColorSet: (foreground: style.foreground, shadow: style.background))
                    
                
                Image(systemName: "eurosign")
                    .font(.footnote)
            }
        }
        .frame(maxWidth: 120, alignment: .leading)
    }
}

#Preview {
    TransactionAmount(transaction: transactions[0], style: Transaction.TransactionType.expense.getTypeStyle())
}
