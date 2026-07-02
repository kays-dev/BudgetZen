//
//  TransactionsListView.swift
//  BudgetZen
//
//  Created by Apprenant174 on 02/07/2026.
//

import SwiftUI

struct TransactionsListView: View {
    @State private var query : String = ""
    
    var body: some View {
        ViewStyle(title: "Toutes les transactions") {
            VStack(spacing: 12){
                ForEach(transactions){ transaction in
                    TransactionRow(transaction: transaction)
                }
                
                HStack{
                
                }
                .searchable(text: $query, prompt: "Rechercher une transaction")
            }
            .frame(maxWidth: .infinity)

        }
        .safeAreaBar(edge: .bottom) {
            
        }

    }
}

#Preview {
    TransactionsListView()
}
