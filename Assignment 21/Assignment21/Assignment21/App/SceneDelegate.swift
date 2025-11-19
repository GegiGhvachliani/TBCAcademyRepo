//
//  SceneDelegate.swift
//  Assignment21
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let viewModel = MainViewModel()
        let mainPage = MainPageVC(viewModel: viewModel)
        
        let navigationController = UINavigationController(rootViewController: mainPage)
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

