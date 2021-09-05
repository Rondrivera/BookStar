//
//  StoryboardManager.swift
//  BookStar
//
//  Created by Ron Rivera on 6/2/21.
//

import UIKit

class StoryboardManager {
    class func segueTo (storyBoard:String, viewController:String) {
        let mainStoryboard = UIStoryboard(name: storyBoard, bundle: nil)
        let homeNavController = mainStoryboard.instantiateViewController(withIdentifier: viewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.replaceRootViewController(with: homeNavController)
    }
    
    class func viewController (fromNames storyBoard:String, viewController:String) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyBoard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewController)
    }


    class func segueToLogin() {
        StoryboardManager.segueTo(storyBoard: "Main", viewController: Constants.Storyboard.authNavigationController)
    }
    
    class func segueToHome() {
        StoryboardManager.segueTo(storyBoard: "Home", viewController: Constants.Storyboard.homeNavigationController)
    }
}
