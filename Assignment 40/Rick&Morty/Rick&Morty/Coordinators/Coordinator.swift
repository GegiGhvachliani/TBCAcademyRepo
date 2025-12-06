//
//  Coordinator.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 05.12.25.
//

import Foundation
import SwiftUI

protocol Coordinator: ObservableObject {
    var path: NavigationPath { get set }
    func start()
}

