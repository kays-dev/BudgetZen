//
//  Helpers.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import Foundation
import SwiftUI

//Types d'information
enum InfoType : String, CaseIterable {
    case general = "Général"
    case income = "Revenu"
    case expense = "Dépense"
}

//Montants totaux
func getTotalIncomes() -> Double {
    return transactions.filter{ $0.type == .income }.map{ $0.amount }.reduce(0, +)
}

func getTotalExpenses() -> Double {
    return transactions.filter{ $0.type == .expense }.map{ $0.amount }.reduce(0, +)
}

func getBalance() -> Double {
    return getTotalIncomes() - getTotalExpenses()
}

//Transactions totales
func getIncomeTransactions() -> Int {
    return transactions.filter{ $0.type == .income }.count
}

func getExpenseTransactions() -> Int {
    return transactions.filter{ $0.type == .expense }.count
}

func getTotalTransactions() -> Int {
    return getIncomeTransactions() + getExpenseTransactions()
}

//Gestion des messages
func getBudgetMessage(_ balance : Double) -> (message: String, symbol: String, bgColor : Color, borderColor : Color, foreground : Color){
    if balance > 0 {
        return (message: "Votre budget est positif.", symbol: "hand.thumbsup", bgColor: Color.positiveBg, borderColor: Color.positiveBorder, foreground: Color.positiveText)
    } else if balance < 0 {
        return (message: "Attention, vos dépenses dépassent vos revenus.", symbol: "exclamationmark.triangle", bgColor: Color.negativeBg, borderColor: Color.negativeBorder, foreground: Color.negativeText)
    } else {
        return (message: "Votre budget est équilibré.", symbol: "minus.square", bgColor: Color.balancedBg, borderColor: Color.balancedBorder, foreground: Color.balancedText)
    }
}

extension View {
    func myViewMessage() -> AnyView {
        AnyView(self)
    }
}

//Filtrage de la liste
func searchTransactions(_ allData : [Transaction],_ searchQuery : String) -> [Transaction] {
    var searchResult : [Transaction] = allData
    
    searchResult = allData.filter{ $0.title.localizedCaseInsensitiveContains(searchQuery) }
    
    return searchResult
}

func filterTransactions(_ allData : [Transaction],_ selectedType : String) -> [Transaction] {
    var filteredResult : [Transaction] = allData
    
    if selectedType == "dépense" {
        filteredResult = allData.filter{ $0.type.rawValue.lowercased() == "dépense" }
    } else if selectedType == "revenu" {
        filteredResult = allData.filter{ $0.type.rawValue.lowercased() == "revenu" }
    }
    
    return filteredResult
}

//Vérification de la saisie
func validAmountQuery(_ query : String, _ amount : Double) -> Double {
    var check : String = query
    var decimal : Double = amount
    
    if check.count(where: { $0 == "," }) > 1 {
        if let overflow = query.lastIndex(of: ",") {
            check.remove(at: overflow)
        }
    }
    
    decimal = Double(check.replacingOccurrences(of: ",", with: ".")) ?? decimal
    
    return decimal
}

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

//Validation du formulaire

