//
//  TransactionTypeBadge.swift
//  BudgetZen
//
//  Created by Apprenant174 on 02/07/2026.
//

import SwiftUI

struct TransactionTypeBadge: View {
    let type : Transaction.TransactionType
    let style : (foreground : Color, border : Color, background : Color, shadow : Color)
    
    var body: some View {
        HStack(spacing: 4){
            Image(systemName: type.getTypeIcon())
            
            Text(type.rawValue)
                .bold()
        }
        .foregroundStyle(style.foreground)
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
        .background{
            Capsule()
                .fill(style.background)
        }
    }
}

#Preview {
    TransactionTypeBadge(type: .expense, style: Transaction.TransactionType.expense.getTypeStyle())
}
