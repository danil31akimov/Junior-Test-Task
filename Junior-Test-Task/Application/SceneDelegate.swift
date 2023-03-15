//
//  SceneDelegate.swift
//  Junior-Test-Task
//
//  Created by Данил Акимов on 14.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = VerificationViewController()
        window?.makeKeyAndVisible()
        
    }

  

}

