//
//  Searchbar.swift
//  BudgetZen
//
//  Created by Apprenant174 on 02/07/2026.
//

import SwiftUI

struct Searchbar: View {
    @Binding var query : String
    
    var body: some View {
        
        HStack{
            Image(systemName: "magnifyingglass")
            
            TextField("Rechercher une transaction", text: $query, axis: .horizontal)
                .lineLimit(1, reservesSpace: true)
                .submitLabel(.search)
                
        }
        .foregroundStyle(.balanceText)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background{
            Capsule()
                .fill(.balanceBg)
        }
    }
}

#Preview {
    struct PreviewSearchbar : View {
        @State private var query : String  = ""
          
          var body : some View {
              Searchbar(query: $query)
          }
      }
      
    return PreviewSearchbar()
}
