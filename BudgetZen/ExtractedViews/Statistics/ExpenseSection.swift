//
//  GlobalSection.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import SwiftUI

struct ExpenseSection: View {
    
    var expense : Double
    var maxExpense : Double
    var averageExpense : Double
    var transaction : Int

    var body: some View {
        
        StatisticsSection(infoType: .expense) { type in
            
            VStack(spacing: 12){
                
                InfoCard(info: (name: "Total", detail: (amount: expense, number: nil, text: nil), type: type), isStatistic: false)
                
                HStack(spacing: 12){
                    
                    InfoCard(info: (name: "Maximum", detail: (amount: maxExpense, number: nil, text: nil), type: type), isStatistic: true, symbol: "rosette")
                    
                    InfoCard(info: (name: "Moyenne", detail: (amount: averageExpense, number: nil, text: nil), type: type), isStatistic: true, symbol: "gauge.with.dots.needle.50percent")
                    
                }
                
                InfoCard(info: (name: "Transactions", detail: (amount: nil, number: transaction, text: nil), type: type), isStatistic: true, symbol: "arrow.left.arrow.right")
                
            }
        }
    }
}

#Preview {
    ExpenseSection(expense: getTotalExpenses(transactions), maxExpense: getMaxExpense(transactions), averageExpense: getAverageExpense(transactions), transaction: getExpenseTransactions(transactions))
}
