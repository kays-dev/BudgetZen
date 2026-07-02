//
//  Searchbar.swift
//  BudgetZen
//
//  Created by Apprenant174 on 02/07/2026.
//

import SwiftUI

struct Searchbar: View {
    @State private var query : String = ""
    
    var body: some View {
        
        HStack{
            Image(systemName: "magnifyingglass")
            
            TextField("Rechercher une transaction", text: $query, axis: .horizontal)
                .lineLimit(1, reservesSpace: true)
        }
        .foregroundStyle(.balanceText)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background{
            Capsule()
                .fill(.balancedBg)
        }
    }
}

#Preview {
    Searchbar()
}
