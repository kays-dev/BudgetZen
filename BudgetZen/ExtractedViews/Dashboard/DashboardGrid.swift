//
//  DashboardGrid.swift
//  BudgetZen
//
//  Created by Apprenant174 on 02/07/2026.
//

import SwiftUI

struct DashboardGrid: View {
    let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible())]
    
    var body: some View {
        VStack(spacing: 12){
            InfoCard(info: (name: "Solde actuel", detail: (amount: getBalance(), number: nil, text: nil), type: .general))
            
            LazyVGrid(columns: columns, spacing: 12) {
                InfoCard(info: (name: "Total des revenus", detail: (amount: getTotalIncomes(), number: nil, text: nil), type: .income))
                InfoCard(info: (name: "Total des dépenses", detail: (amount: getTotalExpenses(), number: nil, text: nil), type: .expense))
                InfoCard(info: (name: nil, detail: (amount: nil, number: getIncomeTransactions(), text: nil), type: .income))
                InfoCard(info: (name: nil, detail: (amount: nil, number: getExpenseTransactions(), text: nil), type: .expense))
            }
            
            InfoCard(info: (name: "Total", detail: (amount: nil, number: getTotalTransactions(), text: nil), type: .general))
        }
    }
}

#Preview {
    DashboardGrid()
}
