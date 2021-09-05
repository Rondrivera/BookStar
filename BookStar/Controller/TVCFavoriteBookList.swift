//
//  TVCFavoriteBookList.swift
//  BookStar
//
//  Created by Arpit Awasthi on 02/09/21.
//

import UIKit

class TVCellFavorite : UITableViewCell {
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var descriptionLabel: UILabel?
    @IBOutlet var bookImage: UIImageView?
    var book : Book!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        setData(for: book)
    }
    
    func setData(for book:Book) {
        self.titleLabel?.text = book.title
        self.descriptionLabel?.text = book.description
        if let url = URL(string: "https" + book.thumbnail.dropFirst(4)) {
            self.imageView?.kf.setImage(with: url)
        }
    }
}


class TVCFavoriteBookList : UITableViewController {
    var favoriteBooks : [Book] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //
        self.loadFavorites()
    }
    
    func loadFavorites() {
        FavoriteManager.shared.updateFavorites { condition, favorites in
            NetworkServices.getFavoriteBooks(favorites: favorites) { books, error in
                guard let bs = books else {return}
                self.favoriteBooks = bs
            }
        }
    }
}

extension TVCFavoriteBookList {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ci_favorite") as! TVCellFavorite;
        cell.book = favoriteBooks[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        StoryboardManager.segueTo(storyBoard: "Home", viewController: Constants.Storyboard.favoriteViewController)
    }
}


    
