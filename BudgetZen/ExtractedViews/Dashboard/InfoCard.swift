//
//  AmountCard.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import SwiftUI

struct InfoCard: View {
    
    let info : (name: String?, detail: (amount: Double?, number: Int?, text: String?), type: InfoType)
    
    var infoStyle : (foreground : Color, border : Color, background : Color, shadow : Color) {
        
        let typeIncome = Transaction.TransactionType.income
        let typeExpense = Transaction.TransactionType.expense
        
        if info.type.rawValue == typeIncome.rawValue {
            return typeIncome.getTypeStyle()
            
        } else if info.type.rawValue == typeExpense.rawValue {
            return typeExpense.getTypeStyle()
            
        } else {
            return (foreground : Color.balanceText, border : Color.balance, background : Color.balancedBg, shadow : Color.balance)
        }
    }
    
    var isStatistic : Bool = false
    var symbol : String = "circle"
    
    var body: some View {
        
        VStack(spacing: 16){
            
            if let title = info.name {
                HStack(spacing: 8){
                    Text(title)

                    
                    if isStatistic {
                        Image(systemName: symbol)
                    }
                }
                .font(.footnote)
                .foregroundStyle(.title)
            }

            MainInfo(amountInfo: info.detail.amount ?? nil , numberInfo: info.detail.number ?? nil, textInfo: info.detail.text ?? nil, isStatistic: isStatistic, infoTypeColors: (foreground: infoStyle.foreground, shadow: infoStyle.shadow))

        }
        .padding(16)
        .cardStyle(infoStyle.border, false)
        
    }
}

#Preview {
    InfoCard(info: (name: "Solde actuel", detail: (amount: 1121.00, number: nil, text: nil), type: .global), symbol: "circle")
}
