//
//  NewTransaction.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct NewTransaction: View {
    @State private var titleEntry : String = ""
    @State private var validTitle : Bool = true
    
    @State private var amountEntry : String = ""
    @State private var amountInDouble : Double = 0.00
    @State private var validAmount : Bool = true
    
    @State private var typeEntry : String = "Choix"
    @State private var validType : Bool = true
    var typeIsIncome : Bool? {
       let type = Transaction.TransactionType.allCases.first(where: { $0.rawValue == typeEntry })
        
        if type == .income {
            return true
        } else if type == nil {
            return nil
        } else {
            return false
        }
    }
    
    @State private var categoryEntry : String = "Choix"
    @State private var validCategory : Bool = true
    
    @State private var dayEntry : String = "01"
    @State private var monthEntry : String = "01"
    let year : String = "2026"
    @State private var changed : Bool = true
    @State private var validDate : Bool = true
    
    
    var body: some View {
        ViewStyle(title: "Nouvelle transaction") {
            VStack(spacing: 12){
                TitleField(entry: $titleEntry, isValid: validTitle)
                
                AmountField(entry: $amountEntry, number: $amountInDouble, isIncome: typeIsIncome, isValid: validAmount)
                
                TypePickerField(entry: $typeEntry, isValid: validType)
                
                CategoryPickerField(entry: $categoryEntry, isValid: validCategory)
                
                DateField(isValid: validDate, entryDay: $dayEntry, entryMonth: $monthEntry, yearValue: year, hasChanged: $changed)
            }
        }
    }
}

#Preview {
    NewTransaction()
}
