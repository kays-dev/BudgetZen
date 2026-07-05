//
//  ViewStyle.swift
//  BudgetZen
//
//  Created by Apprenant174 on 02/07/2026.
//

import SwiftUI

struct ViewStyle<Content: View>: View {
    var isDashboard : Bool = false
    var title : String
    var subtitle : String?
    
    @ViewBuilder var content: () -> Content
    var messages: () -> AnyView = { AnyView(EmptyView()) }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 32){
                    
                    content()
                    
                    
                }
                .frame(maxWidth: .infinity)
                .toolbar{
                    if isDashboard {
                        ToolbarItem(placement: .principal) {
                            Image("appName")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 97)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 24)
            }
            .scrollIndicators(.hidden)
            .safeAreaBar(edge: .top) {
                VStack(spacing: 24){
                    VStack(alignment: .leading, spacing : 4){
                        Text(title)
                            .font(.title)
                            .bold()
                            .foregroundStyle(.title)
                        
                        if subtitle != nil{
                            Text(subtitle!)
                                .font(.subheadline)
                                .foregroundStyle(.secondaryText)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    messages()
                }
                .padding(.bottom, 32)
                .padding(.horizontal, 20)
            }
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity)
            .background(Color.bg)
        }
    }
}

#Preview {
    ViewStyle(isDashboard: true, title: "Tableau de bord", subtitle: "Bonjour à toi ! Prêt à suivre ton budget ?") {
        Text("hi")
    } messages : {
        BudgetMessage(balance: getBalance(transactions)).myViewMessage()
    }
}
