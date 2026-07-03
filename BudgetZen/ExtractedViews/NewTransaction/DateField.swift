//
//  DateField.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct DateField: View {
    @State private var entryDay : String = ""
    @State private var entryMonth : String = ""
    @State private var entryYear : String = ""
    
    var entry : String {
        entryDay + entryMonth + entryYear
    }
    
    var body: some View {
        FieldStyle(fieldBorder: .balance, title: "Date", charLimit: 4, errorMessage: "Vous n'avez pas renseigné de date"){ limit in
            
            HStack{
                TextField("Jour", text: $entryDay, axis: .horizontal)
                    .keyboardType(.numberPad)
                    .onChange(of: entryDay, {
                        
                        entryDay = String(entryDay.prefix(2))
                    })
                
                Text("/")
                
                TextField("Mois", text: $entryMonth, axis: .horizontal)
                    .keyboardType(.numberPad)
                    .onChange(of: entryMonth, {
                        
                        entryMonth = String(entryMonth.prefix(2))
                    })
                
                Text("/")
                
                TextField("Année", text: $entryYear, axis: .horizontal)
                    .keyboardType(.numberPad)
                    .onChange(of: entryYear, {
                        
                        entryYear = String(entryYear.prefix(limit))
                    })
            }
        }
    }
}

#Preview {
    DateField()
}
