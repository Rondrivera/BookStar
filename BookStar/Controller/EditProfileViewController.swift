//
//  EditProfileViewController.swift
//  BookStar
//
//  Created by Ron Rivera on 1/30/22.
//

import UIKit
import Firebase

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var aboutText: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayText: UITextField!
    @IBOutlet weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
         func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let storyboard = UIStoryboard(name: "Home.storyboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EditProfileViewController")
        self.present(vc, animated: true)
        
        }
    }
}
