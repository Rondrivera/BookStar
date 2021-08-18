//
//  LoginViewController.swift
//  BookStar
//
//  Created by Ronald Rivera on 12/23/20.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style of the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(logInButton)
    }

   

    @IBAction func logInTapped(_ sender: Any) {
        
        // Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        NetworkServices.login(email: email, password: password) { success, error, authResult in
            if let error = error, authResult == nil {
                print("Error while signin: \(error)")
                self.errorLabel.text = "Something went wrong while signin. Please try again."
                self.errorLabel.alpha = 1
            } else {
                var userData = [String: Any]()
                userData[User.Keys.id] = Auth.auth().currentUser!.uid
                userData[User.Keys.email] = Auth.auth().currentUser!.email
                User.currentUser.saveUserInformation(userInfo: userData)
                
                NetworkServices.fetchUserInfo { user, error in
                    if let error = error, user == nil {
                        print("Error while signin: \(error)")
                        self.errorLabel.text = "Something went wrong while signin. Please try again."
                        self.errorLabel.alpha = 1
                        
                        do {
                            try Auth.auth().signOut()
                            User.currentUser.logOut()
                        } catch let error {
                            print(error)
                        }
                    } else {
                        let user = user as! User
                        var userData = [String: Any]()
                        userData[User.Keys.firstName] = user.firstName
                        userData[User.Keys.lastName] = user.lastName
                        User.currentUser.saveUserInformation(userInfo: userData)
                        
                        StoryboardManager.segueToHome()
                    }
                }
            }
        }
    }
}
