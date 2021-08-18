//
//  Book.swift
//  BookStar
//
//  Created by Ron Rivera on 4/22/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Book: Codable {
    let id: String
    let title: String
    let description: String
    let authors: [String]
    let publishedDate: String
    let smallThumbnail: String
    let thumbnail: String
    let reviews: [BookReview]?
    let averageRating: Double
    let numberOfReviews: Int
    let documentID: String
    
//    var dictionary: [String: Any] {
//        return ["id":id , "title": title, "description": description , "authors": authors , "publishedDate": publishedDate , "smallThumbnail": smallThumbnail, "thumbnail": thumbnail , "reviews": reviews, "averageRating": averageRating, "numberOfReviews": numberOfReviews, "documentID": documentID]
//    }
//
//    init(id: String, title: String, description: String, authors: String, publishedDate: String, smallThumbnail: String, thumbnail: String, reviews: BookReview, averageRating: Double, numberOfReviews: Int, documentID: String) {
//            self.id = id
//            self.title = title
//            self.description = description
//            self.authors = [authors]
//            self.publishedDate = publishedDate
//            self.smallThumbnail = smallThumbnail
//            self.thumbnail = thumbnail
////            self.reviews = reviews
//            self.averageRating = averageRating
//            self.numberOfReviews = numberOfReviews
//            self.documentID = documentID
//
// //   init() {
//        self.init(id: "", title: "", description: "", authors: "", publishedDate: "", smallThumbnail: "", thumbnail: "", averageRating: 0.0, numberOfReviews: 0, documentID: "")
//    }
//
//    init(dictionary: [String: Any]) {
//            let id = dictionary["id"] as! String? ?? ""
//            let title = dictionary["title"] as! String? ?? ""
//            let description = dictionary["description"] as! String? ?? ""
//            let authors = dictionary["authors"] as! String? ?? ""
//            let publishedDate = dictionary["publishedDate"] as! String? ?? ""
//            let smallThumbnail = dictionary["smallThumbnail"] as! String? ?? ""
//            let reviews = dictionary["reviews"] as! String? ?? ""
//            let averageRating = dictionary["averageRating"] as! Int? ?? 0
//            let numberOfReviews = dictionary["numberOfReviews"] as! Int? ?? 0
//            let documentID = dictionary["documentID"] as! String? ?? ""
//        self.init(id: id, title: title, description: description, authors: authors, publishedDate: publishedDate, smallThumbnail: smallThumbnail, thumbnail: thumbnail, averageRating: Double(averageRating), numberOfReviews: numberOfReviews, documentID: documentID)
//        }
//
//    func updateAverageRating(completed: @escaping () -> ()) {
//
//        let db = Firestore.firestore()
//        let reviewsRef = db.collection("book Cell").document(self.documentID).collection("reviews”)
//
//    //    Get all reviews
//        reviewsRef.getDocuments { (querySnapshot, error) in
//        guard error == nil else {
//            print("ERROR: failed to get query snapshot of reviews for reviewsRef: \(reviewsRef.path), error: \(error!.localizedDescription)”)
//        returnCompleted()
//        }
//        self.averageRating = ratingTotal / Double(querySnapshot!.count)
//        self.numberOfReviews = querySnapshot!.count
//        let dataToSave = self.dictionary // Create a dictionary with the latest values
//            let starAverageRef = db.collection("spots").document(Self.documentID)
//        starAverageRef.setData(dataToSave) { (error) in // Save it
//        if let error = error {
//            print" ERROR: updating document \(self.documentID) in spot after changing averageReview & numberOfReviews info \(error.localizedDescription)")
//        completed()
//        } else {
//            print(" New average \ self.averageRating).Document updated with ref ID \(self.documentID)”)
//        completed()
//            }
//        }
            }
    

