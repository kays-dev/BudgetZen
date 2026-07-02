//
//  DashboardView.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ViewStyle(isDashboard: true, title: "Tableau de bord", subtitle: "Bonjour à toi ! Prêt à suivre ton budget ?") {
            DashboardGrid()
        } messages : {
            BudgetMessage().myViewMessage()
        }
    }
}

#Preview {
    DashboardView()
}
