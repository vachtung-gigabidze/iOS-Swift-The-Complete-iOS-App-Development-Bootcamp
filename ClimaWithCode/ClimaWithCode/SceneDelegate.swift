//
//  SceneDelegate.swift
//  ClimaWithCode
//
//  Created by Дмирий Зядик on 17.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let screneWindow = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: screneWindow)
        window?.rootViewController = WeatherViewController()
        window?.makeKeyAndVisible()
    }

    


}

