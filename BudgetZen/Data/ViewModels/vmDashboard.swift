//
//  vmDashboard.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import Foundation
import SwiftUI

//************ TABLEAU DE BORD

//Montants totaux
func getTotalIncomes(_ array : [ Transaction ]) -> Double {
    return array.filter{ $0.type == .income }.map{ $0.amount }.reduce(0, +)
}

func getTotalExpenses(_ array : [ Transaction ]) -> Double {
    return array.filter{ $0.type == .expense }.map{ $0.amount }.reduce(0, +)
}

func getBalance(_ array : [ Transaction ]) -> Double {
    return getTotalIncomes(array) - getTotalExpenses(array)
}

//Totals des transactions
func getIncomeTransactions(_ array : [ Transaction ]) -> Int {
    return array.filter{ $0.type == .income }.count
}

func getExpenseTransactions(_ array : [ Transaction ]) -> Int {
    return array.filter{ $0.type == .expense }.count
}

func getTotalTransactions(_ array : [ Transaction ]) -> Int {
    return getIncomeTransactions(array) + getExpenseTransactions(array)
}

func actualizeDashboard(_ array : [ Transaction ]) -> (balance : Double, totalTransactions : Int, incomes : Double, incomeTransactions : Int, expenses : Double, expenseTransactions : Int){
    
    let balance = getBalance(array)
    let allTransactions = getTotalTransactions(array)
    let allIncomes = getTotalIncomes(array)
    let incomeTransactions = getIncomeTransactions(array)
    let allExpenses = getTotalExpenses(array)
    let expenseTransactions = getExpenseTransactions(array)
    
    return (balance : balance, totalTransactions : allTransactions, incomes : allIncomes, incomeTransactions : incomeTransactions, expenses : allExpenses, expenseTransactions : expenseTransactions)
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
