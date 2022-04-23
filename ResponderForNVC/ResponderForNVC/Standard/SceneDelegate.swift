//
//  SceneDelegate.swift
//  ResponderForNVC
//
//  Created by Dennis on 4/23/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var nvc: UINavigationController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        nvc = UINavigationController()
        let vc = InitialVC()
        nvc?.setViewControllers([vc], animated: true)
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
        
    }
}

