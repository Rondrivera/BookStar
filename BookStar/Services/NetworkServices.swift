//
//  NetworkServices.swift
//  BookStar
//
//  Created by Ron Rivera on 4/22/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class NetworkServices {
    
    //MARK:- Authentication
    static func login(email: String, password: String, completionHandler: @escaping (_ succeeded: Bool, _ error: Error?, _ authResult: AuthDataResult?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error, result == nil {
                completionHandler(false, error, nil)
            } else {
                completionHandler(true, nil, result)
            }
            
        }
    }
    
    static func signUp(email: String, password: String, completionHandler: @escaping (_ succeeded: Bool, _ error: Error?, _ authResult: AuthDataResult?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error, result == nil {
                completionHandler(false, error, nil)
            } else {
                login(email: email, password: password) { isLoggedIn, error, result in
                    if let error = error, result == nil {
                        completionHandler(false, error, nil)
                    } else {
                        completionHandler(true, nil, result)
                    }
                }
            }
        }
    }
    
    static func saveUserInfo(userData: [String: Any], completionHandler: @escaping (_ succeeded: Bool, _ error: Error?) -> Void) {
        let docRef = Firestore.firestore().collection("Users").document(User.currentUser.id!)
        
        docRef.setData(userData) { error in
            if let error = error {
                completionHandler(false, error)
            } else {
                completionHandler(true, nil)
            }
        }
    }
    
    static func fetchUserInfo(completionHandler: @escaping (_ succeeded: Any?, _ error: Error?) -> Void) {
        let docRef = Firestore.firestore().collection("Users").document(User.currentUser.id!)
        
        docRef.getDocument { snapshot, error in
            
            if let error = error {
                completionHandler(false, error)
            } else if let docSnapshot = snapshot, docSnapshot.exists {
                let user = User(snapshot: docSnapshot)
                completionHandler(user, nil)
            }
            
        }
    }
    
    //MARK:- Book
    static func fetchBooks(genres: String, limit: Int? = nil, completionHandler: @escaping (_ response: Any?, _ error: Error?) -> Void) {
        var ref: Query? = nil
        if let limit = limit {
            ref = Firestore.firestore().collection("Books").document(genres).collection("Books").limit(to: limit)
        } else {
            ref = Firestore.firestore().collection("Books").document(genres).collection("Books")
        }
        
        ref!.getDocuments { (snapshot, error) in
            if let error = error {
                print(error)
                completionHandler(nil, error)
            } else {
                guard let documentSnapshot = snapshot, !documentSnapshot.isEmpty else {
                    print("error")
                    completionHandler(nil, nil)
                    return
                }
                
                let bookDocuments = documentSnapshot.documents
                var books = [Book]()
                for document in bookDocuments {
                    do {
                        let book = try document.data(as: Book.self)
                        books.append(book!)
                    } catch let error {
                        print(error)
                    }
                }
                completionHandler(books, nil)
            }
        }
    }
    
    static func fetchGenres(completionHandler: @escaping (_ response: [String]?, _ error: Error?) -> Void) {
        Firestore.firestore().collection("Books").getDocuments { snapshot, error in
            if let error = error {
                print(error)
                completionHandler(nil, error)
            } else {
                guard let documentSnapshot = snapshot, !documentSnapshot.isEmpty else {
                    print("No data")
                    completionHandler(nil, nil)
                    return
                }
                let genreDocuments = documentSnapshot.documents
                var generes = [String]()
                for document in genreDocuments {
                    generes.append(document.documentID)
                }
                completionHandler(generes, nil)
            }
        }
    }
    
    static func addBookReview(genre: String, book: Book, ratings: Double, reviewText: String, completionHandler: @escaping (_ succeeded: Bool, _ error: Error?) -> Void) {
        let docRef = Firestore.firestore().collection("Books").document(genre).collection("Books").document(book.id).collection("Reviews").document(User.currentUser.id!)
        
        var data = [String: Any]()
        data["bookId"] = book.id
        data["ratings"] = ratings
        data["reviewText"] = reviewText
        data["userId"] = User.currentUser.id!
        data["reviewDate"] = Timestamp(date: Date())
        
        docRef.setData(data, merge: true) { error in
            if let error = error {
                completionHandler(false, error)
            } else {
                completionHandler(true, nil)
            }
        }
    }
    
    static func fetchBookReviews(genre: String, book: Book, limit: Int? = nil, completionHandler: @escaping (_ response: Any?, _ error: Error?) -> Void) {
        var ref: Query? = nil
        if let limit = limit {
            ref = Firestore.firestore().collection("Books").document(genre).collection("Books").document(book.id).collection("Reviews").limit(to: limit)
        } else {
            ref = Firestore.firestore().collection("Books").document(genre).collection("Books").document(book.id).collection("Reviews")
        }
        
        ref!.getDocuments { (snapshot, error) in
            if let error = error {
                print(error)
                completionHandler(nil, error)
            } else {
                guard let documentSnapshot = snapshot, !documentSnapshot.isEmpty else {
                    print("error")
                    completionHandler(nil, nil)
                    return
                }
                
                let reviewDocuments = documentSnapshot.documents
                var reviews = [BookReview]()
                for document in reviewDocuments {
                    do {
                        let review = try document.data(as: BookReview.self)
                        reviews.append(review!)
                    } catch let error {
                        print(error)
                    }
                }
                
                for (index, review) in reviews.enumerated() {
                    let userRef = Firestore.firestore().collection("Users").document(review.userId)
                    userRef.getDocument { (snapshot, error) in
                        if let error = error {
                            print(error)
                        } else if let docSnapshot = snapshot, docSnapshot.exists {
                            if let firstName = docSnapshot.data()![User.Keys.firstName] as? String, let lastName = docSnapshot.data()![User.Keys.lastName] as? String {
                                reviews[index].userName = "\(firstName) \(lastName)"
                            }
                            
                        }
                        completionHandler(reviews, nil)
                    }
                }
            }
        }
    }
}
