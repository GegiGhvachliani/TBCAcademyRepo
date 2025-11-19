//
//  SceneDelegate.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let loginPageViewModel = LoginPageViewModel()
        let quizPageViewModel = QuizPageViewModel()
        
        if loginPageViewModel.isUserLoggedIn() {
            window = UIWindow(windowScene: scene)
            let vc = QuizPageViewController(viewModel: quizPageViewModel)
            window?.rootViewController = UINavigationController(rootViewController: vc)
            window?.makeKeyAndVisible()
        } else {
            window = UIWindow(windowScene: scene)
            let vc = LoginPageViewController(viewModel: LoginPageViewModel())
            window?.rootViewController = UINavigationController(rootViewController: vc)
            window?.makeKeyAndVisible()
        }
    }
}

