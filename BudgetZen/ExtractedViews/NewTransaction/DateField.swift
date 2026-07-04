//
//  DateField.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct DateField: View {
    @State private var entryDay : String = "01"
    var dayValues : [String] {
        validDateQuery(entryDay, entryMonth, entryYear)
    }
    
    @State private var entryMonth : String = "01"
    let monthValues : [String] = (1...12).map{ String($0).count < 2 ? "0" + String($0) : String($0) }
    let monthOf31Days : [String] = ["01", "03", "05", "07", "08", "10", "12"]
    
    @State private var entryYear : String = "2026"
    let yearValue : String = "2026"
    
    var entry : String {
        entryDay + entryMonth + entryYear
    }
    
    var body: some View {
        FieldStyle(fieldBorder: .balance, title: "Date de la transaction", charLimit: 0, errorMessage: "Vous n'avez pas renseigné de date"){ limit in
            
            HStack{
                
                Picker("Jour", selection: $entryDay) {
                    ForEach(dayValues, id: \.self){ day in
                            Text(day)
                                .tag(day)
                    }
                }
                .pickerStyle(.wheel)
                .frame(maxWidth: .infinity)
                
                Text("/")
                
                Picker("Mois", selection: $entryMonth) {
                    ForEach(monthValues, id: \.self){ month in
                            Text(month)
                                .tag(month)
                    }
                }
                .pickerStyle(.wheel)
                .frame(maxWidth: .infinity)
                
                Text("/")

                Text(yearValue)
                    .font(.title3)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .frame(maxWidth: .infinity)
   
            }
            .frame(height: 80)
            .mask {
                RoundedRectangle(cornerRadius: 28)
            }
        }
    }
}

#Preview {
    DateField()
}
