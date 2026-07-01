//
//  Models.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import Foundation
import SwiftUI

struct Transaction : Identifiable, Hashable {
    let id = UUID()
    
    let title: String
    let amount : Double
    let type : TransactionType
    let category : Category
    let date : String
    
    //Type des transactions
    enum TransactionType : String, CaseIterable {
        case income = "Revenu"
        case expense = "Dépense"
    }
    
    static func getTypeStyle(_ typeValue : TransactionType) -> (foreground : Color, border : Color, background : Color, shadow : Color){
        switch typeValue{
        case .income :
            (foreground : Color.incomeText,
             border : Color.income,
             background : Color.incomeBg,
             shadow : Color.income)
        case .expense :
            (foreground : Color.expenseText,
             border : Color.expense,
             background : Color.expenseBg,
             shadow : Color.expense)
        }
    }
    
    //Catégorie des transactions
    enum Category : String, CaseIterable {
        case transport = "Transport"
        case shopping = "Shopping"
        case health = "Santé"
        case work = "Travail"
        case food = "Alimentation"
        case hobby = "Loisir"
        case other = "Autre"
    }
    
    static func getCategoryIcon(_ categoryValue : Category) -> String {
        switch categoryValue{
        case .transport :
            return "car.2"
        case .shopping :
            return "storefront"
        case .health :
            return "cross.vial"
        case .work :
            return "suitcase"
        case .food :
            return "takeoutbag.and.cup.and.straw"
        case .hobby :
            return "xmark.triangle.circle.square"
        case .other :
            return "ellipsis"
        }
    }
}
