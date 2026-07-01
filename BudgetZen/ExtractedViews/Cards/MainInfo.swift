//
//  MainInfo.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import SwiftUI

struct MainInfo: View {
    var amountInfo : Double? = nil
    var numberInfo : Int? = nil
    var textInfo : String? = nil
    
    let infoTypeColors : (foreground: Color, shadow: Color)
    
    var body: some View {
            if let doubleInfo = amountInfo {
                VStack(spacing: 4){
                    Text("\(doubleInfo, specifier: "%.2f")")
                        .mainInfoStyle(infoColorSet: infoTypeColors)
                    
                    Image(systemName: "eurosign")
                }
                .frame(maxWidth: .infinity)
            } else if let integerInfo = numberInfo {
                VStack(spacing: 4){
                    Text("\(integerInfo)")
                        .mainInfoStyle(infoColorSet: infoTypeColors)
                    
                    Text("transactions")
                        .font(.footnote)
                }
                .frame(maxWidth: .infinity)
            } else if let stringInfo = textInfo {
                VStack(spacing: 4){
                    Text(stringInfo)
                        .mainInfoStyle(infoColorSet: infoTypeColors)
                }
                .frame(maxWidth: .infinity)
            }
    }
}

#Preview {
    MainInfo(infoTypeColors: (foreground: .balanceText, shadow: .balance))
}
