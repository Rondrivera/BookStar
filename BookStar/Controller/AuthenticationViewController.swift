//
//  AuthenticationViewController.swift
//  BookStar
//
//  Created by Ron Rivera on 6/8/21.
//

import UIKit

class AuthenticationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if User.currentUser.isLoggedIn == true {
            StoryboardManager.segueToHome()
            return
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
