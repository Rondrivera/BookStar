//
//  AddReviewController.swift
//  BookStar
//
//  Created by Ronald Rivera on 12/10/20.
//

import UIKit
import CoreData
import Cosmos

//protocol AddReview {
//    func addReview(name: String)
// }

class AddReviewController: UIViewController {
    @IBOutlet weak var startView: CosmosView!
    @IBOutlet weak var reviewField: UITextField!
    
    var selectedBook: Book!
    var selectedGenre: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addAction(_ sender: Any) {
        NetworkServices.addBookReview(genre: selectedGenre, book: selectedBook, ratings: startView.rating, reviewText: reviewField.text!) { isAdded, error in
            if let error = error {
                print("Error while adding review!")
                print(error)
            } else {
                print("Review Added!")
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
   
}
