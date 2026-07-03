//
//  TitleField.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct TitleField: View {
    @State private var entry : String = ""
    
    var body: some View {
        
        FieldStyle(fieldBorder: .balance, title: "Intitulé", charLimit: 45, errorMessage: "Ce champs ne doit pas être vide"){ limit in
            
            TextField("Renseignez l'intitulé de la transaction", text: $entry, axis: .horizontal)
                .keyboardType(.asciiCapable)
                .onChange(of: entry, {
                    entry = String(entry.prefix(limit))
                })
        }

    }
}

#Preview {
    TitleField()
}
