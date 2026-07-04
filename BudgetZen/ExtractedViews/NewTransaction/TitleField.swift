//
//  TitleField.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct TitleField: View {
    @Binding var entry : String
    
    var isValid : Bool
    
    var body: some View {
        
        FieldStyle(fieldBorder: .balance, title: "Titre", charLimit: 45, errorMessage: "Veuillez renseigner le titre de la transaction", isValid: isValid){ limit in
            
            TextField("Ex: Salle de sport", text: $entry, axis: .horizontal)
                .keyboardType(.asciiCapable)
                .onChange(of: entry, {
                    entry = String(entry.prefix(limit))
                })
        }

    }
}

#Preview {
    TitleField(entry: .constant(""), isValid : false)
}
