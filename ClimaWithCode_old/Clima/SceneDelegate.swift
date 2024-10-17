//
//  SceneDelegate.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scemeWindow = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scemeWindow)
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
    }
}
