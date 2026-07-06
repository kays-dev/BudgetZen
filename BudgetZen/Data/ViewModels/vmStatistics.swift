//
//  vmStatistics.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import Foundation
import SwiftUI

//************ STATISTIQUES

//Catégorie la plus utilisée
func getMostUsedCategory(_ array : [Transaction]) -> String {
    
    let categories : [Transaction.Category] = array.map{ $0.category }.sorted{ $0.rawValue > $1.rawValue }
    
    var splitedArray : [[Transaction.Category]] = []
    var inCategory : [Transaction.Category]  = []
    
    for i in 1..<categories.count {
        
        if categories[ i ] == categories[ i - 1] {
            
            inCategory.append(categories[ i ])
            
        } else {
            
            inCategory.append(categories[ i ])
            splitedArray.append(inCategory)
            
            inCategory = []
        }
        
    }
    
    let counts : [Int] = splitedArray.map{ $0.count }
    
    let maxCountCategory : [Transaction.Category] = splitedArray[splitedArray.firstIndex( where : { $0.count == counts.max()! } ) ?? 0]
    
    return maxCountCategory.first!.rawValue
}

//Statistiques des revenus
func getMaxIncome(_ array : [ Transaction ]) -> Double {
    return array.filter{ $0.type == .income }.map{ $0.amount }.max()!
}

//Statistiques des dépenses
func getMaxExpense(_ array : [ Transaction ]) -> Double {
    return array.filter{ $0.type == .expense }.map{ $0.amount }.max()!
}

func getAverageExpense(_ array : [ Transaction ]) -> Double {
    return getTotalExpenses(array) / Double(getExpenseTransactions(array))
}

func actualizeStatistics(_ array : [ Transaction ]) -> (balance : Double, totalTransactions : Int, mainCategory: String, incomes : Double, maxIncome: Double, incomeTransactions : Int, expenses : Double, maxExpense: Double, averageExpense : Double, expenseTransactions : Int){
    
    let dashboardInfos = actualizeDashboard(array)
    
    let mainCategory = getMostUsedCategory(array)
    let maxIncome = getMaxIncome(array)
    let maxExpense = getMaxExpense(array)
    let averageExpense = getAverageExpense(array)
    
    return (balance : dashboardInfos.balance, totalTransactions : dashboardInfos.totalTransactions, mainCategory: mainCategory, incomes : dashboardInfos.incomes, maxIncome: maxIncome, incomeTransactions : dashboardInfos.incomeTransactions, expenses : dashboardInfos.expenses, maxExpense: maxExpense, averageExpense : averageExpense, expenseTransactions : dashboardInfos.expenseTransactions)
}

//Messages de conseil
func getAdviceMessage(_ array : [Transaction]) -> (title: String, message: String, symbol: String, bgColor : Color, borderColor : Color, foreground : Color){
    
    if array.isEmpty {
        
        return (title: "Aucune transaction", message: "Ajoutez une première transaction pour commencer", symbol: "plus.circle", bgColor: Color.balancedBg, borderColor: Color.balancedBorder, foreground: Color.balancedText)
        
    } else if getExpenseTransactions(array) > getIncomeTransactions(array) {
        
        return (title: "Dépenses en hausse", message: "Essayez de réduire vos dépenses cette semaine.", symbol: "exclamationmark.triangle", bgColor: Color.negativeBg, borderColor: Color.negativeBorder, foreground: Color.negativeText)
        
    } else if getBalance(array) > 0 {
        
        return (title: "Solde positif", message: "Bravo, vous avez une bonne gestion de votre budget", symbol: "crown", bgColor: Color.positiveBg, borderColor: Color.positiveBorder, foreground: Color.positiveText)
        
    } else if getBalance(array) < 0 {
        
        return (title: "Dépenses supérieures aux revenus", message: "Attention, votre budget est négatif", symbol: "exclamationmark.triangle", bgColor: Color.negativeBg, borderColor: Color.negativeBorder, foreground: Color.negativeText)
        
    } else {
        return (title: "Rien à signaler", message: "Aucun conseil pour le moment", symbol: "", bgColor: Color.balancedBg, borderColor: Color.balancedBorder, foreground: Color.balancedText)
    }
}
