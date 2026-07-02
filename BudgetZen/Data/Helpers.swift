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
    
    if !searchQuery.isEmpty{
         searchResult = allData.filter{ $0.title.localizedCaseInsensitiveContains(searchQuery) }
    }
    
    return searchResult
}
