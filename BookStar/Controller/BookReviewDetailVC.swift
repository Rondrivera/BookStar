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
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var starAverage: UILabel!
    
    var selectedBook: Book!
    var selectedGenre: String! {
        didSet {
            fetchReviews()
        }
    }

    var reviews: [BookReview] = []
    var myReviews: [String: String] = [:]
    var averageRating: Double!
    var numberOfReviews: Int!
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
        self.setViewData(book: self.selectedBook)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setViewData(book:Book) {
        if let url = URL(string: "https" + book.thumbnail.dropFirst(4)) {
            bookImg.kf.setImage(with: url)
        }
        bookTitle.text = book.title
        bookDescription.text = book.description
        self.favoriteButton.isSelected = FavoriteManager.shared.isFavorite(book.id)
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
                    self.starAverage.text = String(format: "%.2f out of 5", avgRating)
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
    
    @IBAction func favoriteTouched(_ sender: Any) {
        NetworkServices.addFavorite( bookID: selectedBook.id, genre: selectedGenre) { success, error in
            print("success = ", success, error)
            if success {
                if let b = sender as? UIButton {
                    b.isSelected = true
                }
                FavoriteManager.shared.updateFavorites { updated, favorite in
                }
            }
        }
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

