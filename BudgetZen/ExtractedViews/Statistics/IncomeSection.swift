//
//  GlobalSection.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import SwiftUI

struct IncomeSection: View {
    
    var incomes : Double
    var maxIncome : Double
    var transaction : Int

    
    var infoType : InfoType

    var body: some View {
        
        StatisticsSection(title: "Revenus") {
            
            VStack(spacing: 12){
                
                InfoCard(info: (name: "Total", detail: (amount: incomes, number: nil, text: nil), type: infoType), isStatistic: false)
                
                InfoCard(info: (name: "Plus grand revenu", detail: (amount: maxIncome, number: nil, text: nil), type: infoType), isStatistic: true, symbol: "trophy")

                    InfoCard(info: (name: "Transactions", detail: (amount: nil, number: transaction, text: nil), type: infoType), isStatistic: true, symbol: "arrow.left.arrow.right")
 
            }
            
        }
        
    }
}

#Preview {
    IncomeSection(incomes: getTotalIncomes(transactions), maxIncome: getMaxIncome(transactions), transaction: getTotalTransactions(transactions), infoType: .income)
}
