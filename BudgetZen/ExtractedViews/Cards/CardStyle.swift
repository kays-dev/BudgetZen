//
//  CardStyle.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import SwiftUI

struct CardStyle: ViewModifier {
    var cardBorder : Color
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .foregroundStyle(.primaryText)
            .background{
                RoundedRectangle(cornerRadius: 24)
                    .fill(cardBorder)
                    .overlay{
                        ZStack{
                            RoundedRectangle(cornerRadius: 24)
                                .fill(.bg)
                                
                            RoundedRectangle(cornerRadius: 24)
                                .fill(.cardBg)
                        }
                        .padding(.top, 4)
                        .padding([.leading,.trailing,.bottom], 1)
                    }
            }
    }
}

extension View { func cardStyle(cardBorders : Color) -> some View {
    modifier( CardStyle(cardBorder: cardBorders))}

}

private struct StylePreview: View {
    var body: some View {
        VStack{
            Text("Title")
            Text("Title")
            Text("Title")
            Text("Title")
        }
        .padding()
            .cardStyle(cardBorders: .balance)
    }
}

#Preview {
    StylePreview()
}
