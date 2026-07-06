//
//  vmTransactions.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import Foundation

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
