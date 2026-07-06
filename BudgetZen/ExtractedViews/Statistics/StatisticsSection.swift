//
//  StatisticsSection.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import SwiftUI

struct StatisticsSection<Content: View>: View {
    var title : String
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(spacing: 20){
            
            Text(title)
                .font(.title3)
                .bold()
                .foregroundStyle(.secondaryText)
            
            content()
                .frame(maxWidth: .infinity)
            
        }

    }
}

#Preview {
    StatisticsSection(title: "Global") {
        
    }
}
