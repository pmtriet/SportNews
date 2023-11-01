//
//  SceneDelegate.swift
//  SportNews0210
//
//  Created by Minh Triet Pham on 02/10/2023.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var navigationWelcome : UINavigationController?
    var tabbarController : UITabBarController?
 
    var window: UIWindow?
    
    


    func createTabBarControllerAndWelcome()
    {
        
//        let tabBarController = UITabBarController()
        let tabbarController = UITabBarController()
        // Create View Controllers for the tabs
        let homeViewController = HomeViewController()
//        homeViewController.view.backgroundColor = .red
//        homeViewController.title = "Home"
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        let navController1 = UINavigationController(rootViewController: homeViewController)
        
        let browserViewController = BrowserViewController()
//        browserViewController.view.backgroundColor = .blue
//        browserViewController.title = "Browser"
        browserViewController.tabBarItem = UITabBarItem(title: "Browser", image: UIImage(named: "browser"), selectedImage: UIImage(named: "browser"))
        let navController2 = UINavigationController(rootViewController: browserViewController)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let profilesViewController = storyboard.instantiateViewController(withIdentifier: "profilesVC")
       
//        profilesViewController.view.backgroundColor = .white
//        profilesViewController.title = "Profiles"
        profilesViewController.tabBarItem = UITabBarItem(title: "Profiles", image: UIImage(named: "profiles"), selectedImage: UIImage(named: "profiles"))
        let navController3 = UINavigationController(rootViewController: profilesViewController)
        
        // Set the view controllers for the tab bar controller
        tabbarController.viewControllers = [navController1, navController2, navController3]
        self.tabbarController = tabbarController
        
        
        self.navigationWelcome = storyboard.instantiateViewController(withIdentifier: "idNavigationWelcome") as? UINavigationController
    }

    
    func setupRootViewTabbar() {
//        createTabBarController()
            //Setup Your Root Here
        window?.rootViewController  = self.tabbarController
            //window?.rootViewController = objNavigationVC
        window?.makeKeyAndVisible()
        }
    func setupRootViewWelcome() {
            //Setup Your Root Here
        window?.rootViewController  = self.navigationWelcome
            //window?.rootViewController = objNavigationVC
        window?.makeKeyAndVisible()
        }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        self.createTabBarControllerAndWelcome()
        
        
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

