//
//  SceneDelegate.swift
//  CatsApp
//
//  Created by Nikoloz Gachechiladze on 19.11.23.
//

import UIKit
import NetworkLayerPackage

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let mainScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: mainScene)
        let firstVC = ViewController()
        let secondVC = BreedsViewController()
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstVC, secondVC]
        firstVC.tabBarItem = UITabBarItem(title: "Cat facts", image: nil, tag: 0)
        secondVC.tabBarItem = UITabBarItem (title: "Breeds", image: nil, tag: 1)
        let tabBarAppearance = UITabBarItem.appearance()
        tabBarAppearance.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

