//
//  CardStyle.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import SwiftUI

struct CardStyle: ViewModifier {
    var cardBorder : Color
    var isTransaction : Bool = false
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .foregroundStyle(.primaryText)
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(cardBorder)
                    .overlay{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.bg)
                                
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.cardBg)
                        }
                        .padding(.top, isTransaction ? 1 : 4)
                        .padding(.bottom, 1)
                        .padding(.leading, isTransaction ? 0 : 1)
                        .padding(.trailing, isTransaction ? 4 : 1)
                    }
            }
    }
}

extension View { func cardStyle(_ cardBorders : Color, _ isTransaction : Bool) -> some View {
    modifier( CardStyle(cardBorder: cardBorders, isTransaction: isTransaction))}

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
        .cardStyle(.balance, false)
    }
}

#Preview {
    StylePreview()
}
