//
//  ReviewTableViewCell.swift
//  BookStar
//
//  Created by Ron Rivera on 6/15/21.
//

import UIKit
import Cosmos

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var reviewTextLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(review: BookReview) {
        ratingView.rating = review.ratings
        reviewTextLabel.text = review.reviewText
        userNameLabel.text = review.userName
    }

}
