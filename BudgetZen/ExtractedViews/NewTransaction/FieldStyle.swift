//
//  FieldStyle.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct FieldStyle<Content: View>: View {
    var fieldBorder : Color
    
    var title : String
    var charLimit : Int
    
    var errorMessage : String
    var isValid : Bool = true
    
    @ViewBuilder var content: (_ limit : Int) -> Content
    
    var body: some View {
        
        VStack{
            FieldCard(title: title, borders: fieldBorder) {
                
                content(charLimit)
                    .multilineTextAlignment(.center)
                    .lineLimit(1, reservesSpace: true)
                    .bold()
            }
            
            if !isValid {
                Text(errorMessage)
                    .font(.footnote)
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    FieldStyle(fieldBorder: .balance, title: "Intitulé", charLimit: 45, errorMessage: "Ce champs ne doit pas être vide") { limit in

    }
}
