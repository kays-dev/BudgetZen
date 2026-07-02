//
//  TransactionRow.swift
//  BudgetZen
//
//  Created by Apprenant174 on 02/07/2026.
//

import SwiftUI

struct TransactionRow: View {
    let transaction : Transaction
    var transactionStyle : (foreground : Color, border : Color, background : Color, shadow : Color) {
        
        transaction.type.getTypeStyle()
    }
    
    var body: some View {
        HStack{
            TransactionCard(transaction: transaction, style: transactionStyle)
            
            TransactionAmount(transaction: transaction, style: transactionStyle)
        }
    }
}

#Preview {
    TransactionRow(transaction: transactions[0])
}
