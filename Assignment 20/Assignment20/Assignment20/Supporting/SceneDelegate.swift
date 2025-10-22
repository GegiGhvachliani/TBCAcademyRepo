//
//  SceneDelegate.swift
//  Assignment20
//
//  Created by Gegi Ghvachliani on 20.10.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        window.rootViewController = TabBarVC()
        self.window = window
        self.window?.makeKeyAndVisible()
    }

}

