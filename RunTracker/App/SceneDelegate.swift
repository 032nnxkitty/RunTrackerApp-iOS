//
//  SceneDelegate.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        UserDefaults.standard.isOnboarded = false
        
        window = UIWindow(windowScene: windowScene)
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = UserDefaults.standard.isOnboarded ? TabBarController() : OnboardingViewController()
        window?.makeKeyAndVisible()
    }
}
