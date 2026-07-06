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
    
    var infoType : InfoType

    var body: some View {
        
        StatisticsSection(title: "Global") {
            
            VStack(spacing: 12){
                
                InfoCard(info: (name: "Solde", detail: (amount: balance, number: nil, text: nil), type: infoType), isStatistic: false)
                
                HStack(spacing: 12){
                    
                    InfoCard(info: (name: "Transactions", detail: (amount: nil, number: transaction, text: nil), type: infoType), isStatistic: true, symbol: "arrow.left.arrow.right")
                    
                    InfoCard(info: (name: "Catégorie majeure", detail: (amount: nil, number: nil, text: category), type: infoType), isStatistic: true, symbol: "trophy")
                    
                }
                
            }
        }
    }
}

#Preview {
    GlobalSection(balance: getBalance(transactions), transaction: getTotalTransactions(transactions), category: getMostUsedCategory(transactions), infoType: .global)
}
