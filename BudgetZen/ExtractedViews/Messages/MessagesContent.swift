//
//  MessagesContent.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import SwiftUI

struct MessagesContent: View {
    var title : String
    var icon : String
    var message : String
    
    var isAdvice : Bool = false
    
    var body: some View {
        
        VStack(spacing: 4){
            
            Image(systemName: icon)
                .symbolVariant(.fill)
                .font(.subheadline)
            
            if isAdvice {
                
                Text("""
            \(title)
            """)
                .font(.footnote)
                .bold()
                
            }
            
        }
        
        Text("""
            \(message)
            """)
        .font(.footnote)
        
    }
}

#Preview {
    MessagesContent(title: "", icon: "circle", message: "")
}
