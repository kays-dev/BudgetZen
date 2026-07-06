//
//  vmNewTransaction.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import Foundation

//************ FORMULAIRE

//Champs du formulaire
enum FocusableField: Hashable {
    case title, amount
}

//Vérification des saisies
func validDateQuery(_ dayQuery : String,_ monthQuery : String,_ yearQuery : String) -> [String] {
    
    var days : [String] = []
    let monthOf31Days : [String] = ["01", "03", "05", "07", "08", "10", "12"]
    
    if monthQuery == "02"{
        
        if let year = Int(yearQuery){
            
            if year % 4 == 1 || year % 400 == 1 {
                
                days = (1...29).map{ String($0).count < 2 ? "0" + String($0) : String($0)}
            } else {
                
                days = (1...28).map{ String($0).count < 2 ? "0" + String($0) : String($0)}
            }
        }
        
    } else if monthOf31Days.contains(monthQuery){
        days = (1...31).map{ String($0).count < 2 ? "0" + String($0) : String($0)}
        
    } else {
        days = (1...30).map{ String($0).count < 2 ? "0" + String($0) : String($0)}
        
    }
    
    return days
}

func validTypeQuery(_ type : String) -> Transaction.TransactionType {
    return Transaction.TransactionType.allCases.first(where: { $0.rawValue == type })!
}

func validCategoryQuery(_ category : String) -> Transaction.Category {
    return Transaction.Category.allCases.first(where: { $0.rawValue == category })!
}

//Validation du formulaire
func validTransactionForm(_ title : String, _ amount : Double, _ type : String, _ category : String, _ date : String) -> (title : Bool, amount : Bool, type : Bool, category : Bool, date : Bool){
    
    var validTitle : Bool = true
    var validAmount : Bool = true
    var validType : Bool = true
    var validCategory : Bool = true
    var validDate : Bool = true
    
    if title.isEmpty {
        validTitle = false
    }
    
    if amount <= 0.00 {
        validAmount = false
    }
    
    if type.isEmpty {
        validType = false
    }
    
    if category.isEmpty {
        validCategory = false
    }
    
    if date.isEmpty {
        validDate = false
    }
    
    return (title : validTitle, amount : validAmount, type : validType, category : validCategory, date : validDate)
}

func addNewTransaction(_ title : String, _ amount : Double, _ type : String, _ category : String, _ date : String){
    
    let type = validTypeQuery(type)
    let category = validCategoryQuery(category)
    
    let newTransaction : Transaction = Transaction(title: title, amount: amount, type: type, category: category, date: date)
    
    transactions.append(newTransaction)
}

func formatDate (_ date : String) -> Date{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    
    return dateFormatter.date(from: date)!
}
