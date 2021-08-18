//
//  BookSelectionVC.swift
//  BookStar
//
//  Created by Ronald Rivera on 12/3/20.
//

import UIKit

class BookSelectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedGenre: String!
    var books: [Book] = []
    var bookToPass: Book!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fetchBooks()
    }
    
    func fetchBooks() {
        NetworkServices.fetchBooks(genres: selectedGenre) { (books, error) in
            if let error = error {
                print(error)
            } else if let bookList = books as? [Book] {
                self.books = bookList
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath) as? BookCell {
            let book = books[indexPath.item]
            cell.configureCell(book: book)
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let cellDimension = (width / 2) - 15
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        bookToPass = books[indexPath.item]
        performSegue(withIdentifier: "toBookSelection", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? BookReviewDetailVC {
            detailsVC.selectedBook = bookToPass
            detailsVC.selectedGenre = selectedGenre
        }
    }
}
