//
//  GlobalSection.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import SwiftUI

struct GlobalSection: View {
    
    var balance : Double
    var transaction : Int
    var category : String

    var body: some View {
        
        StatisticsSection(infoType: .global) { type in
            
            VStack(spacing: 12){
                
                InfoCard(info: (name: "Solde", detail: (amount: balance, number: nil, text: nil), type: type), isStatistic: false)
                
                HStack(spacing: 12){
                    
                    InfoCard(info: (name: "Transactions", detail: (amount: nil, number: transaction, text: nil), type: type), isStatistic: true, symbol: "arrow.left.arrow.right")
                    
                    InfoCard(info: (name: "Catégorie majeure", detail: (amount: nil, number: nil, text: category), type: type), isStatistic: true, symbol: "rosette")
                    
                }
                
            }
        }
    }
}

#Preview {
    GlobalSection(balance: getBalance(transactions), transaction: getTotalTransactions(transactions), category: getMostUsedCategory(transactions))
}
