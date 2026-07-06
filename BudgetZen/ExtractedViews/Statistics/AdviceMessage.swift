//
//  AdviceMessage.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import SwiftUI

struct AdviceMessage: View {
    var body: some View {
        VStack(spacing: 16){
            MessagesContent(title: getAdviceMessage(transactions).title, icon: getAdviceMessage(transactions).symbol, message: getAdviceMessage(transactions).message, isAdvice: true)
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .foregroundStyle(getAdviceMessage(transactions).foreground)
        .background{
            RoundedRectangle(cornerRadius: 20)
                .fill(getAdviceMessage(transactions).bgColor)
                .stroke(getAdviceMessage(transactions).borderColor, lineWidth : 1)
        }
    }
}

#Preview {
    AdviceMessage()
}
