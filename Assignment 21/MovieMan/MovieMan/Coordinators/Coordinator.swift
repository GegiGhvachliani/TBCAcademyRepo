//
//  Coordinator.swift
//  MovieMan
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    
    func start()
}
