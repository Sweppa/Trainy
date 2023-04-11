//
//  SceneDelegate.swift
//  DControl
//
//  Created by Yaroslav on 23.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
//      let homePageNC = UINavigationController(rootViewController: HomePageVC())
//      let lightsNC = UINavigationController(rootViewController: LightsVC())
//      let rollerShuttersNC = UINavigationController(rootViewController: RollerShuttersVC())
//      let heatersNC = UINavigationController(rootViewController: HeatersVC())

        
        let tabbar = UITabBarController()
        tabbar.viewControllers = [createHomePageNC(), createSettingsNC()]
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabbar
        window?.makeKeyAndVisible()
    }
    
    
    func createHomePageNC() -> UINavigationController {
        let homePageVC = HomePageVC()
        homePageVC.title = "HomePage"
        homePageVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "AppIcon"), tag: 0)
        
        return UINavigationController(rootViewController: homePageVC)
    }
    
    
    func createSettingsNC() -> UINavigationController {
        let settingsNC = SettingsVC()
        //settingsNC.title = "Settings"
        settingsNC.tabBarItem = UITabBarItem(title: "Yaroslavs Videos", image: UIImage(named: "camSign"), tag: 1)
        
        return UINavigationController(rootViewController: settingsNC)
    }
    

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

