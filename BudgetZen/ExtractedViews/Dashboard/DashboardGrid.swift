//
//  DashboardGrid.swift
//  BudgetZen
//
//  Created by Apprenant174 on 02/07/2026.
//

import SwiftUI

struct DashboardGrid: View {
    let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible())]
    
    var balance : Double
    var incomes : Double
    var expenses : Double
    var transactionsCount : Int
    var incomesCount : Int
    var expensesCount : Int
    
    var body: some View {
        VStack(spacing: 12) {
            
            InfoCard(info: (name: "Solde actuel", detail: (amount: balance, number: nil, text: nil), type: .global))
            
            LazyVGrid(columns: columns, spacing: 12) {
                
                InfoCard(info: (name: "Revenus", detail: (amount: incomes, number: nil, text: nil), type: .income))
                
                InfoCard(info: (name: "Dépenses", detail: (amount: expenses, number: nil, text: nil), type: .expense))
                
                InfoCard(info: (name: nil, detail: (amount: nil, number: incomesCount, text: nil), type: .income))
                
                InfoCard(info: (name: nil, detail: (amount: nil, number: expensesCount, text: nil), type: .expense))
            }
            
            InfoCard(info: (name: "Total", detail: (amount: nil, number: transactionsCount, text: nil), type: .global))
        }

    }
}

#Preview {
    DashboardGrid(balance: getBalance(transactions), incomes: getTotalIncomes(transactions), expenses: getTotalExpenses(transactions), transactionsCount: getTotalTransactions(transactions), incomesCount: getIncomeTransactions(transactions), expensesCount: getExpenseTransactions(transactions))
}
