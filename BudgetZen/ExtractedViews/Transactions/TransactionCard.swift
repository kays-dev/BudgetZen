//
//  TransactionCard.swift
//  BudgetZen
//
//  Created by Apprenant174 on 02/07/2026.
//

import SwiftUI

struct TransactionCard: View {
    let transaction : Transaction
    let style : (foreground : Color, border : Color, background : Color, shadow : Color)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack(spacing: 8){
                TransactionTypeBadge(type: transaction.type, style: style)
                
                Text(transaction.date)
                    .foregroundStyle(.secondaryText)
            }
            .font(.caption2)
            
            VStack(alignment: .leading, spacing: 8){
                Text(transaction.title)
                    .bold()
                
                HStack(spacing: 4){
                    Image(systemName: transaction.category.getCategoryIcon())
                    
                    Text(transaction.category.rawValue)
                }
                .font(.footnote)
            }
            .foregroundStyle(.primaryText)
            .padding(.leading, 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .cardStyle(style.border, true)
    }
}

#Preview {
    TransactionCard(transaction: transactions[0], style: Transaction.TransactionType.expense.getTypeStyle())
}
