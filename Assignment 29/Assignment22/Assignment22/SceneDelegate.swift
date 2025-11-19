//
//  SceneDelegate.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 25.10.25.
//

import UIKit
import Countries
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        let vc = CountryListVC(viewModel: MainPageViewModel())
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
    }
}

