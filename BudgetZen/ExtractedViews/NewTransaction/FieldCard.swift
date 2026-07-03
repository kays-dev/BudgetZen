//
//  FieldCard.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct FieldCard<Content: View>: View {
    var title : String
    var borders : Color
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(spacing: 20){
            
            Text(title)
                .font(.footnote)
                .foregroundStyle(.title)
            
            HStack{
                
                content()
                    .frame(maxWidth: .infinity)
                
            }
            .frame(maxWidth: .infinity)
            
        }
        .padding(16)
        .cardStyle(borders, false)
    }
}

#Preview {
    FieldCard(title: "Montant", borders: .balance) {
        
        Image(systemName: "plus.circle.fill")
        
        Spacer()
        
        Text("Champs")
            .foregroundStyle(.secondaryText.opacity(0.4))
            .bold()
        
        
        Spacer()
        
        Image(systemName: "eurosign")
    }
}
