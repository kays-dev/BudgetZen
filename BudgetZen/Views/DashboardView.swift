//
//  DashboardView.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import SwiftUI

struct DashboardView: View {
    @State private var infos : (balance : Double, totalTransactions : Int, incomes : Double, incomeTransactions : Int, expenses : Double, expenseTransactions : Int) = (balance : 0, totalTransactions : 0, incomes : 0, incomeTransactions : 0, expenses : 0, expenseTransactions : 0)
    
    var body: some View {
        ViewStyle(isDashboard: true, title: "Tableau de bord", subtitle: "Bonjour à toi ! Prêt à suivre ton budget ?") {
            DashboardGrid(balance: infos.balance, incomes: infos.incomes, expenses: infos.expenses, transactionsCount: infos.totalTransactions, incomesCount: infos.incomeTransactions, expensesCount: infos.expenseTransactions)
        } messages : {
            BudgetMessage(balance: infos.balance).myViewMessage()
        }
        .onChange(of: transactions) { _, newValue in
            infos = actualizeDashboard(newValue)
        }
        .task {
            infos = actualizeDashboard(transactions)
        }
    }
}

#Preview {
    DashboardView()
}
