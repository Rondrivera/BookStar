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
    var books: [Book] = [] {
        didSet {
            filteredBooks = books
        }
    }
    var filteredBooks: [Book] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
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
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath) as? BookCell {
            let book = filteredBooks[indexPath.item]
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
        performSegue(withIdentifier: "toBookSelection", sender: filteredBooks[indexPath.item])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? BookReviewDetailVC, let book = sender as? Book {
            detailsVC.selectedBook = book
            detailsVC.selectedGenre = selectedGenre
        }
    }
}

extension BookSelectionVC:UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filter(searchText)
    }
    
    func filter (_ filterText:String?) {
        guard let text = filterText, text.count > 0 else {
            filteredBooks = books
            return
        }
        filteredBooks = books.filter { ($0.title.range(of: text, options: .caseInsensitive) != nil) || ($0.description.range(of: text, options: .caseInsensitive) != nil)}
    }
}
