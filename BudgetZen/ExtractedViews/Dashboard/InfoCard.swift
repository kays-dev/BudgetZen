//
//  AmountCard.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import SwiftUI

struct InfoCard: View {
    let info : (name: String?, detail: (amount: Double?, number: Int?, text: String?), type: InfoType)
    
    var body: some View {
        VStack(spacing: 16){
            
            if let title = info.name {
                Text(title)
                    .font(.footnote)
                    .foregroundStyle(.title)
            }

            MainInfo(amountInfo: info.detail.amount ?? nil , numberInfo: info.detail.number ?? nil, textInfo: info.detail.text ?? nil, infoTypeColors: (foreground: info.type == .income ? .incomeText : (info.type == .expense ? .expenseText : .balanceText), shadow: info.type == .income ? .income : (info.type == .expense ? .expense : .balance)))

        }
        .padding(16)
        .cardStyle(cardBorders: info.type == .income ? .income : (info.type == .expense ? .expense : .balance))
    }
}

#Preview {
    InfoCard(info: (name: "Solde actuel", detail: (amount: 1121.00, number: nil, text: nil), type: .general))
}
