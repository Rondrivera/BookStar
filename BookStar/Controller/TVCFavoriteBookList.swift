//
//  TVCFavoriteBookList.swift
//  BookStar
//
//  Created by Arpit Awasthi on 02/09/21.
//

import UIKit

class TVCellFavoriteBook : UITableViewCell {
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var descriptionLabel: UILabel?
    @IBOutlet var bookImage: UIImageView?
    var book : Book! {
        didSet {
            setData(for: book)
        }
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(for book:Book) {
        self.titleLabel?.text = book.title
        self.descriptionLabel?.text = book.description
        if let url = URL(string: "https" + book.thumbnail.dropFirst(4)) {
            self.bookImage?.kf.setImage(with: url)
        }
    }
}


class TVCFavoriteBookList : UITableViewController {
    var favorites: [Favorite] = [] {
        didSet {
            self.loadBooks(favorites: self.favorites)
        }
    }

    var favoriteBooks : [Book] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.favorites = FavoriteManager.shared.favorites
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //
        self.loadFavorites()
    }
    
    func loadFavorites() {
        FavoriteManager.shared.updateFavorites { condition, favorites in
            self.favorites = favorites
        }
    }
    
    func loadBooks(favorites:[Favorite]) {
        NetworkServices.getFavoriteBooks(favorites: favorites) { books, error in
            guard let bs = books else {return}
            self.favoriteBooks = bs
        }
    }
}

//MARK: Table View
extension TVCFavoriteBookList {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteBooks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ci_tvCellFavoriteBook") as! TVCellFavoriteBook;
        cell.book = favoriteBooks[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "si_favoriteToDetail", sender: indexPath)
    }
}

//MARK: Navigation

extension TVCFavoriteBookList {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BookReviewDetailVC, let ip = sender as? IndexPath {
            let selectedBook = self.favoriteBooks[ip.row]
            vc.selectedBook = selectedBook
            vc.selectedGenre = FavoriteManager.shared.genre(bookID: selectedBook.id)
        }
    }
}


    
