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
    
    var isStatistic : Bool
    
    let infoTypeColors : (foreground: Color, shadow: Color)
    
    var body: some View {
        VStack(spacing: 4){
            
            if let doubleInfo = amountInfo {

                    Text("\(doubleInfo, specifier: "%.2f")")
                        .mainInfoStyle(infoColorSet: infoTypeColors)
                    
                    Image(systemName: "eurosign")

            } else if let integerInfo = numberInfo {

                    Text("\(integerInfo)")
                        .mainInfoStyle(infoColorSet: infoTypeColors)
                    
                if !isStatistic {
                    Text("transactions")
                        .font(.footnote)
                }

            } else if let stringInfo = textInfo {

                    Text(stringInfo)
                        .mainInfoStyle(infoColorSet: infoTypeColors)

            }
            
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    MainInfo(isStatistic: false, infoTypeColors: (foreground: .balanceText, shadow: .balance))
}
