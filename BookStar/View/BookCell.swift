//
//  BookCell.swift
//  BookStar
//
//  Created by Ronald Rivera on 12/3/20.
//

import UIKit
import Foundation
import Firebase
import FirebaseFirestoreSwift

class BookCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImg: UIImageView!
    
    var averageRating: Double = 0.0
    var numberOfReviews: Int = 0
    var documentID: String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bookImg.layer.cornerRadius = 10
    }
    
    func configureCell(book: Book) {
        if let url = URL(string: "https" + book.thumbnail.dropFirst(4)) {
            bookImg.kf.setImage(with: url)
        }
        
        let starButton = UIButton(type: .system)
       // starButton.setImage(starButton, for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        starButton.tintColor = .red
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        
        
     //   accessoryView = starButton
    }
        @objc private func  handleMarkAsFavorite() {
            print("Marking as favorite")
        }
    
    func updateAverageRating(completed: @escaping () -> ()) {
     
        let db = Firestore.firestore()
        let reviewsRef = db.collection("book").document(self.documentID).collection("reviews")

    //    Get all reviews
        reviewsRef.getDocuments { (querySnapshot, error) in
        guard error == nil else {
            print("ERROR: failed to get query snapshot of reviews for reviewsRef: \(reviewsRef.path), error: \(error!.localizedDescription)")
        return completed()
        }
            var ratingTotal = 0.0 // This will hold the total of all review ratings
            for document in querySnapshot!.documents { // Loop through all reviews
                let reviewDictionary = document.data()
                let rating = reviewDictionary["rating"] as! Int? ?? 0 // Read in the rating of each review
                ratingTotal = ratingTotal + Double(rating)
            }
            
        self.averageRating = ratingTotal / Double(querySnapshot!.count)
        self.numberOfReviews = querySnapshot!.count
 //       let dataToSave = self.dictionary // Create a dictionary with the latest values
            let starAverageRef = db.collection("book Cell").document(self.documentID)
//        starAverageRef.setData(dataToSave) { (error) in // Save it
        if let error = error {
            print ("ERROR: updating document \(self.documentID) in spot after changing averageReview & numberOfReviews info \(error.localizedDescription)")
        completed()
        } else {
    //        print("New average \ self.averageRating).Document updated with ref ID \(self.documentID)")
        completed()
                }
            }
        }
    }

