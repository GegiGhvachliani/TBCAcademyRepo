//
//  SceneDelegate.swift
//  MultithreadingAndConcurrency
//
//  Created by ATitberidze on 10/30/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ImageViewController()
        window?.makeKeyAndVisible()
    }
}
