//
//  NewTransaction.swift
//  BudgetZen
//
//  Created by Apprenant174 on 03/07/2026.
//

import SwiftUI

struct NewTransaction: View {
    @State private var titleEntry : String = ""
    
    @State private var amountEntry : String = ""
    @State private var amountInDouble : Double = 0.00
    
    @State private var typeEntry : String = ""
    var typeIsIncome : Bool? {
       let type = Transaction.TransactionType.allCases.first(where: { $0.rawValue == typeEntry })
        
        if type == .income {
            return true
        } else if type == .expense {
            return false
        } else {
            return nil
        }
    }
    
    @State private var categoryEntry : String = ""
    
    @State private var dayEntry : String = "01"
    @State private var monthEntry : String = "01"
    let year : String = "2026"
    @State private var changed : Bool = false
    var dateEntry : String {
        if !changed {
            return ""
        } else {
           return dayEntry + "/" + monthEntry + "/" +  year
        }
    }
    
    @State private var isValidField : (title : Bool, amount : Bool, type : Bool, category : Bool, date : Bool) = (title : true, amount : true, type : true, category : true, date : true)
    
    @FocusState private var focused : FocusableField?
    
    var body: some View {
        ViewStyle(title: "Ajouter une transaction") {
            VStack(spacing: 12){
                TitleField(entry: $titleEntry, isValid: isValidField.title)
                    .focused($focused, equals: .title)
                    .submitLabel(.continue)
                    .onSubmit {
                        focused = .amount
                    }

                AmountField(entry: $amountEntry, number: $amountInDouble, isIncome: typeIsIncome, isValid: isValidField.amount)
                    .focused($focused, equals: .amount)
                    .submitLabel(.done)
                    .onSubmit {
                        focused = nil
                    }
                
                TypePickerField(entry: $typeEntry, isValid: isValidField.type)
                
                CategoryPickerField(entry: $categoryEntry, isValid: isValidField.category)
                
                DateField(isValid: isValidField.date, entryDay: $dayEntry, entryMonth: $monthEntry, yearValue: year, hasChanged: $changed)
            }
            
            Button{
                
                isValidField = validTransactionForm(titleEntry, amountInDouble, typeEntry, categoryEntry, dateEntry)
                
                if isValidField == (title : true, amount : true, type : true, category : true, date : true) {
                    
                    addNewTransaction(titleEntry, amountInDouble, typeEntry, categoryEntry, dateEntry)
                    
                    titleEntry = ""
                    amountEntry = ""
                    typeEntry = ""
                    categoryEntry = ""
                    dayEntry = "01"
                    monthEntry = "01"
                    
                    changed = false
                    isValidField = (title : true, amount : true, type : true, category : true, date : true)
                    
                }
                
            } label: {
                Text("Ajouter")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.bg)
                    .padding(.horizontal, 64)
                    .padding(.vertical, 8)
                    .contentShape(.capsule)
            }
            .buttonStyle(.glassProminent)

        }
        .scrollDismissesKeyboard(.immediately)
        .onTapGesture {
            focused = nil
        }

    }
}

#Preview {
    NewTransaction()
}
