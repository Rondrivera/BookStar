//
//  User.swift
//  BookStar
//
//  Created by Ron Rivera on 6/1/21.
//

import Foundation
import Firebase

class User {
    var id: String?
    var email: String?
    var firstName: String?
    var lastName: String?
    
    var isLoggedIn: Bool {
        return id != nil
    }
    
    static let currentUser: User  = {
        let instance = User()
        return instance
    }()
    
    init() {
        setUp()
    }
    
    init(snapshot: DocumentSnapshot) {
        id = snapshot.data()![User.Keys.id] as? String
        email = snapshot.data()![User.Keys.email] as? String
        firstName = snapshot.data()![User.Keys.firstName] as? String
        lastName = snapshot.data()![User.Keys.lastName] as? String
    }
    
    func setUp() {
        id = UserDefaults.standard.string(forKey: User.Keys.id)
        email = UserDefaults.standard.string(forKey: User.Keys.email)
        firstName = UserDefaults.standard.string(forKey: User.Keys.firstName)
        lastName = UserDefaults.standard.string(forKey: User.Keys.lastName)
    }
    
    func saveUserInformation(userInfo: [String: Any]) {
        if let id = userInfo[User.Keys.id] as? String {
            self.id = id
            UserDefaults.standard.setValue(id, forKey: User.Keys.id)
        }
        
        if let email = userInfo[User.Keys.email] as? String {
            self.email = email
            UserDefaults.standard.setValue(email, forKey: User.Keys.email)
        }
        
        if let firstName = userInfo[User.Keys.firstName] as? String {
            self.firstName = firstName
            UserDefaults.standard.setValue(firstName, forKey: User.Keys.firstName)
        }
        
        if let lastName = userInfo[User.Keys.lastName] as? String {
            self.lastName = lastName
            UserDefaults.standard.setValue(lastName, forKey: User.Keys.lastName)
        }
    }
    
    func logOut() {
        
        do {
            try Auth.auth().signOut()
        } catch {
            print("Logout fail!")
        }
        id = nil
        email = nil
        firstName = nil
        lastName = nil
        
        UserDefaults.standard.set(nil, forKey: User.Keys.id)
        UserDefaults.standard.set(nil, forKey: User.Keys.email)
        UserDefaults.standard.set(nil, forKey: User.Keys.firstName)
        UserDefaults.standard.set(nil, forKey: User.Keys.lastName)
    }
    
    
}

extension User {
    enum Keys {
        static let id = "id"
        static let email = "email"
        static let firstName = "firstName"
        static let lastName = "lastName"
    }
}
