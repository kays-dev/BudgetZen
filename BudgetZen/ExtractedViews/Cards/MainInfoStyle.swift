//
//  MainInfoStyle.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import SwiftUI

struct MainInfoStyle: ViewModifier {
    var infoColorSet : (foreground : Color, shadow : Color)
    
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .bold()
            .foregroundStyle(infoColorSet.foreground.shadow(.inner(color: infoColorSet.shadow,radius: 8, x: 4)))
    }
}

extension View { func mainInfoStyle(infoColorSet: (foreground: Color, shadow: Color)) -> some View {
    modifier( MainInfoStyle(infoColorSet: infoColorSet))}

}

private struct StylePreview: View {
    var body: some View {
        Text("Testtttt")
            .mainInfoStyle(infoColorSet: (foreground: .balanceText, shadow: .balance))
    }
}

#Preview {
    StylePreview()
}
