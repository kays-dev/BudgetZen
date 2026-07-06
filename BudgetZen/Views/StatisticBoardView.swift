//
//  StatisticBoardView.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import SwiftUI

struct StatisticBoardView: View {
    
    @State private var statistics : (balance : Double, totalTransactions : Int, mainCategory: String, incomes : Double, maxIncome: Double, incomeTransactions : Int, expenses : Double, maxExpense: Double, averageExpense : Double, expenseTransactions : Int) = (balance : 0, totalTransactions : 0, mainCategory: "", incomes : 0, maxIncome: 0, incomeTransactions : 0, expenses : 0, maxExpense: 0, averageExpense : 0, expenseTransactions : 0)
    
    var body: some View {
        ViewStyle(title: "Analyse des transactions") {
            GlobalSection(balance: statistics.balance, transaction: statistics.totalTransactions, category: statistics.mainCategory)
            
            IncomeSection(incomes: statistics.incomes, maxIncome: statistics.maxIncome, transaction: statistics.incomeTransactions)
            
            ExpenseSection(expense: statistics.expenses, maxExpense: statistics.maxExpense, averageExpense: statistics.averageExpense, transaction: statistics.expenseTransactions)

        }
        .onChange(of: transactions) { _, newValue in
            statistics = actualizeStatistics(newValue)
        }
        .task {
            statistics = actualizeStatistics(transactions)
        }
    }
}

#Preview {
    StatisticBoardView()
}
