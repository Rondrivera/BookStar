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
    
}
    
