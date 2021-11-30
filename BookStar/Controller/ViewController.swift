//
//  ViewController.swift
//  BookStar
//
//  Created by Ronald Rivera on 11/17/20.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [[String: [Book]]] = []
    var genreToPass: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FavoriteManager.shared.updateFavorites { updated, favorites in}
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchBooks()
    }
    
    func fetchBooks() {
        let group = DispatchGroup()
        NetworkServices.fetchGenres { genres, error in
            if let error = error {
                print(error)
            } else if let genreList = genres {
                for genres in genreList {
                    group.enter()
                    NetworkServices.fetchBooks(genres: genres, limit: 3) { (books, error) in
                        if let error = error {
                            print(error)
                        } else if let bookList = books as? [Book] {
                            self.data.append([genres: bookList])
                            print("Data - \(self.data.count)")
                            group.leave()
                        }
                    }
                }
                group.notify(queue: .main) {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    @IBAction func didTapLogout() {
        User.currentUser.logOut()
        StoryboardManager.segueToLogin()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell {
            let bookData = data[indexPath.row]
            let genre = bookData.keys.first!
            let books = bookData.values.first!
            
            cell.configureCell(genre: genre, books: books)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        genreToPass = data[indexPath.row].keys.first!
        performSegue(withIdentifier: "toBookSelection", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bookVC = segue.destination as? BookSelectionVC {
            bookVC.selectedGenre = genreToPass
        }
    }
}

