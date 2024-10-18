//
//  SceneDelegate.swift
//  FlashChatWithCode
//
//  Created by Дмирий Зядик on 18.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let ws = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: ws)
        let welcomeVC = WelcomeViewController()
        window?.rootViewController = UINavigationController(rootViewController: welcomeVC)
        window?.makeKeyAndVisible()
        
    }

    


}

