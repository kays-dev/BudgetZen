//
//  Helpers.swift
//  BudgetZen
//
//  Created by Apprenant174 on 01/07/2026.
//

import Foundation
import SwiftUI

//Types d'information
enum InfoType : String, CaseIterable {
    case global = "Global"
    case income = "Revenu"
    case expense = "Dépense"
}

//Conversion des messages en AnyView
extension View {
    func myViewMessage() -> AnyView {
        AnyView(self)
    }
}
