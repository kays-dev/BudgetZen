//
//  DateField.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct DateField: View {
    var isValid : Bool
    
    @Binding var entryDay : String
    var dayValues : [String] {
        validDateQuery(entryDay, entryMonth, yearValue)
    }
    
    @Binding var entryMonth : String
    let monthValues : [String] = (1...12).map{ String($0).count < 2 ? "0" + String($0) : String($0) }

    let yearValue : String
    
    @Binding var hasChanged : Bool
    
    var body: some View {
        FieldStyle(fieldBorder: .balance, title: "Date", charLimit: 0, errorMessage: "Veuillez sélectionner une nouvelle date", isValid: isValid){ limit in
            
            HStack{
                
                Picker("Jour", selection: $entryDay) {
                    ForEach(dayValues, id: \.self){ day in
                            Text(day)
                                .tag(day)
                    }
                }
                .pickerStyle(.wheel)
                .frame(maxWidth: .infinity)
                .onChange(of: entryDay) {
                    hasChanged = true
                }
                
                Text("/")
                
                Picker("Mois", selection: $entryMonth) {
                    ForEach(monthValues, id: \.self){ month in
                            Text(month)
                                .tag(month)
                    }
                }
                .pickerStyle(.wheel)
                .frame(maxWidth: .infinity)
                .onChange(of: entryMonth) {
                    hasChanged = true
                }
                
                Text("/")

                Text(yearValue)
                    .font(.title3)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .frame(maxWidth: .infinity)
   
            }
            .frame(height: 92)
            .padding(.top, -32)
        }
    }
}

#Preview {
    DateField(isValid: false, entryDay: .constant("01"), entryMonth: .constant("01"), yearValue: "2026", hasChanged: .constant(false))
}
