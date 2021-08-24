//
//  BookReviewDetailVC.swift
//  BookStar
//
//  Created by Ronald Rivera on 12/4/20.
//

import UIKit
import CoreData
import Firebase
import FirebaseFirestoreSwift

class BookReviewDetailVC: UITableViewController {
    
    @IBOutlet weak var bookImg: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookDescription: UILabel!

    @IBOutlet weak var starAverage: UILabel!
    
    var selectedBook: Book!
    var reviews: [BookReview] = []
    var myReviews: [String: String] = [:]
    var averageRating: Double!
    var numberOfReviews: Int!
    var selectedGenre: String!
    var errorMessage: String = ""
    var showMessage: Bool = false {
        didSet {
            if showMessage {
                let messageLabel = UILabel(frame: view.bounds)
                messageLabel.numberOfLines = 0
                messageLabel.textAlignment = .center
                messageLabel.text = errorMessage
                messageLabel.sizeToFit()
                tableView.tableFooterView = messageLabel
            }else{
                tableView.tableFooterView = nil
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https" + selectedBook.thumbnail.dropFirst(4)) {
            bookImg.kf.setImage(with: url)
        }
        
        bookTitle.text = selectedBook.title
        bookDescription.text = selectedBook.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //fetch fresh review
        fetchReviews()
    }
    
    func fetchReviews() {
        NetworkServices.fetchBookReviews(genre: selectedGenre, book: selectedBook) { (reviews, error) in
            if let error = error {
                print(error)
            } else if let reviewList = reviews as? [BookReview] {
                self.reviews = reviewList
                if self.reviews.count == 0 {
                    self.errorMessage = "No reviews available. Please add one."
                    self.showMessage = true
                } else {
                    self.errorMessage = ""
                    self.showMessage = false
                }
                self.tableView.reloadData()
                
                if self.reviews.count == 0 {
                    self.starAverage.text = "_._"
                } else {
                    let sum = self.reviews.reduce(0, {$0 + $1.ratings})
                    let avgRating = sum/Double(self.reviews.count)
                    self.starAverage.text = "\(avgRating) out of 5"
                }
            } else {
                self.errorMessage = "No reviews available. Please add one."
                self.showMessage = true
            }
        }
    }
    
    @IBAction func didTapAddReview() {
        performSegue(withIdentifier: "AddReview", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? AddReviewController {
            detailsVC.selectedBook = selectedBook
            detailsVC.selectedGenre = selectedGenre
        }
    }
}

extension BookReviewDetailVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
        cell.configureCell(review: reviews[indexPath.row])
        return cell
    }
}

