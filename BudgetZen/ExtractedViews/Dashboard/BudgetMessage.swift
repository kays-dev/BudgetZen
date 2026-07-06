//
//  BudgetMessage.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import SwiftUI

struct BudgetMessage: View {
    var balance : Double
    
    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 8){
            MessagesContent(title: "", icon: getBudgetMessage(balance).symbol, message: getBudgetMessage(balance).message)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .foregroundStyle(getBudgetMessage(balance).foreground)
        .background{
            RoundedRectangle(cornerRadius: 24)
                .fill(getBudgetMessage(balance).bgColor)
                .stroke(getBudgetMessage(balance).borderColor, lineWidth : 1)
        }
    }
}

#Preview {
    BudgetMessage(balance: getBalance(transactions))
}
