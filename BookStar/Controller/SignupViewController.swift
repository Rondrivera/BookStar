//
//  SignupViewController.swift
//  BookStar
//
//  Created by Ronald Rivera on 12/23/20.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    
    //Check the fields and validate that the data is correct.  If everything is correct. This method returns nil. Otherwise it returns the error message
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
//        if Utilities.isPasswordValid(cleanedPassword) == false {
//            // Password isn't secure enough
//            return "Please make sure your password is at least 8 characters, contains a special character and a number."
//        }
        
        return nil
    }
    

    @IBAction func signUpTapped(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            NetworkServices.signUp(email: email, password: password) { success, error, authResult in
                if let error = error, authResult == nil {
                    print("Error while signup: \(error)")
                    self.errorLabel.text = "Something went wrong while signUp. Please try again."
                    self.errorLabel.alpha = 1
                } else {
                    var userData = [String: Any]()
                    userData[User.Keys.id] = Auth.auth().currentUser!.uid
                    userData[User.Keys.email] = Auth.auth().currentUser!.email
                    userData[User.Keys.firstName] = firstName
                    userData[User.Keys.lastName] = lastName
                    User.currentUser.saveUserInformation(userInfo: userData)
                    
                    self.errorLabel.alpha = 0
                    
                    NetworkServices.saveUserInfo(userData: userData) { success, error in
                        if let error = error {
                            print("Error while saving user data: \(error)")
                            self.errorLabel.text = "Something went wrong while signUp. Please try again."
                        } else {
                            User.currentUser.saveUserInformation(userInfo: userData)
                            
                            StoryboardManager.segueToHome()
                        }
                    }
                }
            }
        }
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }

}
