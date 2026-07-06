//
//  StatisticBoardView.swift
//  BudgetZen
//
//  Created by Apprenant174 on 06/07/2026.
//

import SwiftUI

struct StatisticBoardView: View {
    var body: some View {
        ViewStyle(title: "Analyse des transactions") {
            StatisticsSection(title: "Global") {
                
            }
            
            StatisticsSection(title: "Revenus") {
                
            }
            
            StatisticsSection(title: "Dépenses") {
                
            }
        }
        .task {
            print(getMostUsedCategory(transactions))
        }
    }
}

#Preview {
    StatisticBoardView()
}
