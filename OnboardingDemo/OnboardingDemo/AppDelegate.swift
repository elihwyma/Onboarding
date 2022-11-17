//
//  AppDelegate.swift
//  OnboardingDemo
//
//  Created by Somica on 28/09/2022.
//

import UIKit
import Onboarding
import OnBoardingKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        let onboardingVC = OnboardingViewController(title: "Test", description: "Example Description", symbolName: "square.and.arrow.down.on.square")
        onboardingVC.addBulletin(title: "Test", description: "Super Cool Description", symbol: "square.and.arrow.down.on.square")
        onboardingVC.addBulletin(title: "Woah its a list?", description: "Lorem Ipsum Deez Nutz", symbol: "externaldrive")
        onboardingVC.addBulletin(title: "Boo", description: "Aaaaaaaaaaa", symbol: "eye")
        
        let button = OnboardingButton(type: .filled(color: .systemBlue), title: "BOob")
        onboardingVC.addButton(button)
        
        let cancel = OnboardingButton(type: .clear(textColor: .systemBlue), title: "Cancel")
        onboardingVC.addButton(cancel)
        
        let vc = UIViewController(nibName: nil, bundle: nil)
        vc.view.backgroundColor = .systemBackground
        
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.window = window
        
        vc.present(onboardingVC, animated: true)
        
        return true
    }

}

