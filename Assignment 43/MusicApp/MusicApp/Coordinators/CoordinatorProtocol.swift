//
//  CoordinatorProtocol.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import SwiftUI

protocol Coordinator: AnyObject {
    var path: NavigationPath { get set }
    
    func showDetails(_ music: Music)
    func pop()
    func popToRoot()
}
