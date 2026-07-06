//
//  Helpers.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import Foundation
import SwiftUI

//************ COMPOSANTS

//Types d'information
enum InfoType : String, CaseIterable {
    case global = "Global"
    case income = "Revenu"
    case expense = "Dépense"
}

extension View {
    func myViewMessage() -> AnyView {
        AnyView(self)
    }
}

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

//************ LISTE

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

//************ FORMULAIRE

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
