//
//  TrashViewModel.swift
//  GesturesAndAnimations
//
//  Created by Gegi Ghvachliani on 08.12.25.
//

import SwiftUI
import Combine

protocol TrashViewModelProtocol {
    func deleteProject(name: String)
}

class TrashViewModel: ObservableObject, TrashViewModelProtocol {
    @Published var projects: [String] = [
        "UIKIT",
        "Calculator.App",
        "Dziii",
        "Dzveli Borbali"
    ]
    
    func deleteProject(name: String) {
        projects.removeAll { $0 == name }
    }
}
