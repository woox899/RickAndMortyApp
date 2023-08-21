//
//  AppDelegate.swift
//  RickAndMortyApp
//
//  Created by Андрей Бабкин on 17.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let presenter: CharactersPresentorProtocol = CharactersPresenter()
        let vc: CharactersViewControllerProtocol = CharactersViewController(presenter: presenter)
        presenter.viewController = vc
        let nav = UINavigationController(rootViewController: vc as! UIViewController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        Thread.sleep(forTimeInterval: 3)
        return true
    }
}

