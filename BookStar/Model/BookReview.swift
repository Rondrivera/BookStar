//
//  Review.swift
//  BookStar
//
//  Created by Ron Rivera on 5/31/21.
//

import Foundation
import Firebase

struct BookReview: Codable {
    let bookId: String
    let userId: String
    var userName: String?
    let reviewText: String
    let ratings: Double
    let reviewDate: Timestamp
}
