//
//  TransactionsListView.swift
//  BudgetZen
//
//  Created by Apprenant174 on 02/07/2026.
//

import SwiftUI

struct TransactionsListView: View {
    @State private var query : String = ""
    
    @State private var initialValues : [Transaction] = transactions.sorted{ $0.date > $1.date}
    
    var body: some View {
        ViewStyle(title: "Toutes les transactions") {
            ScrollView{
                VStack(spacing: 12){
                    ForEach(searchTransactions(initialValues, query)){ transaction in
                        TransactionRow(transaction: transaction)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .safeAreaBar(edge: .top) {
                HStack{
                    Searchbar(query: $query)
                        .padding(.bottom, 32)
                }
            }
        }
        .scrollDisabled(true)

    }
}

#Preview {
    TransactionsListView()
}
