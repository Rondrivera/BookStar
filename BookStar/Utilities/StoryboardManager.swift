//
//  StoryboardManager.swift
//  BookStar
//
//  Created by Ron Rivera on 6/2/21.
//

import UIKit

class StoryboardManager {
    class func segueToLogin() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let authNavController = mainStoryboard.instantiateViewController(withIdentifier: Constants.Storyboard.authNavigationController) as! UINavigationController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.replaceRootViewController(with: authNavController)
    }
    
    class func segueToHome() {
        let mainStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeNavController = mainStoryboard.instantiateViewController(withIdentifier: Constants.Storyboard.homeNavigationController) as! UITabBarController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.replaceRootViewController(with: homeNavController)
    }
}
