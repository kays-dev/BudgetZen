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

    var body: some View {
        
        StatisticsSection(infoType: .income) { type in
            
            VStack(spacing: 12){
                
                InfoCard(info: (name: "Total", detail: (amount: incomes, number: nil, text: nil), type: type), isStatistic: false)
                
                InfoCard(info: (name: "Maximum", detail: (amount: maxIncome, number: nil, text: nil), type: type), isStatistic: true, symbol: "rosette")

                    InfoCard(info: (name: "Transactions", detail: (amount: nil, number: transaction, text: nil), type: type), isStatistic: true, symbol: "arrow.left.arrow.right")
 
            }
            
        }
        
    }
}

#Preview {
    IncomeSection(incomes: getTotalIncomes(transactions), maxIncome: getMaxIncome(transactions), transaction: getTotalTransactions(transactions))
}
