//
//  AmountCard.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import SwiftUI

struct AmountCard: View {
    let amount : (name: String, detail: Double, type: InfoType)
    
    var body: some View {
        VStack(spacing: 16){
            Text("\(amount.name)")
                .font(.footnote)
                .foregroundStyle(.title)
            
            MainInfo(amountInfo: amount.detail ,infoTypeColors: (foreground: .balanceText, shadow: .balance))
        }
        .padding(16)
        .cardStyle(cardBorders: amount.type == .income ? .income : (amount.type == .expense ? .expense : .balance))
    }
}

#Preview {
    AmountCard(amount: (name: "Solde actuel", detail: 1121.00, type: .general))
}
