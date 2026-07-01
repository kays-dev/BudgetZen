//
//  DashboardView.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 32){
                Image("appName")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 97)
                
                VStack(spacing: 16){
                    VStack(alignment: .leading, spacing : 4){
                        Text("Tableau de bord")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.title)
                        
                        Text("Bonjour à toi ! Prêt à suivre ton budget ?")
                            .font(.subheadline)
                            .foregroundStyle(.secondaryText)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //Message automatique
                }
                
                VStack {
                    //Grid de cartes
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
        .background(Color.bg)
    }
}

#Preview {
    DashboardView()
}
