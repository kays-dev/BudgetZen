//
//  StatisticsSection.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import SwiftUI

struct StatisticsSection<Content: View>: View {
    var infoType : InfoType
    var title : String {
        infoType != .global ? "\(infoType.rawValue)s" : infoType.rawValue
    }
    
    @ViewBuilder var content: (_ type : InfoType) -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            
            Text(title)
                .font(.title3)
                .bold()
                .foregroundStyle(.secondaryText)
                .padding(.leading, 4)
            
            content(infoType)
                .frame(maxWidth: .infinity)
            
        }

    }
}

#Preview {
    StatisticsSection(infoType: .global) { type in
        
    }
}
