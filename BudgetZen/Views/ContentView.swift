//
//  ContentView.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("Accueil", systemImage: "square.grid.2x2.fill") {
                DashboardView()
            }
            
            Tab("Transactions", systemImage: "eurosign.arrow.trianglehead.counterclockwise.rotate.90") {
                TransactionsListView()
            }
            
            Tab("Nouveau", systemImage: "rectangle.and.pencil.and.ellipsis") {
                NewTransaction()
            }
            
            Tab("Statistiques", systemImage: "waveform.path.ecg") {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
