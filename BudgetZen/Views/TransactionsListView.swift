//
//  TransactionsListView.swift
//  BudgetZen
//
//  Created by Apprenant174 on 02/07/2026.
//

import SwiftUI

struct TransactionsListView: View {
    @State private var query : String = ""
    
    @State private var selectedFilter : String = "tous"
    
    @State private var results : [Transaction] = []
 
    private func applySearchAndFilters(){
        var list = transactions.sorted{ formatDate($0.date) > formatDate($1.date)}
        
        if !query.isEmpty {
            list = searchTransactions(list, query)
        }
        
        if !selectedFilter.isEmpty{
            list = filterTransactions(list, selectedFilter)
        }
        
        results = list
    }
    
    var body: some View {
        ViewStyle(title: "Toutes les transactions") {
            VStack{
                VStack(spacing: 12){
                    ForEach(results){ transaction in
                        TransactionRow(transaction: transaction)
                    }
                }
                .frame(maxWidth: .infinity)
                .onChange(of: query) {
                    applySearchAndFilters()
                }
                .onChange(of: selectedFilter) {
                    applySearchAndFilters()
                }
            }
            .task {
                applySearchAndFilters()
            }
        } areaBarOption: {
            AnyView(
                HStack(spacing: 16){
                Searchbar(query: $query)
                
                Menu {
                    Text("Choisissez un filtre")
                    
                    Picker("Type de transaction",selection: $selectedFilter) {
                        Text("Tous")
                            .tag("tous")
                        
                        ForEach(Transaction.TransactionType.allCases, id: \.self){ type in
                            Text("\(type.rawValue)s")
                                .tag(type.rawValue.lowercased())
                                .font(.headline)
                        }
                    }
                    
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .foregroundStyle(.bg)
                        .font(.title)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 6)
                        .background{
                            Circle()
                                .fill(.accent)
                        }
                }
                .contentShape(Circle())
                .glassEffect(.regular, in : .circle)
                
            }
                )
        }
    }
}

#Preview {
    TransactionsListView()
}
