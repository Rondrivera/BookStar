//
//  CategoryCell.swift
//  BookStar
//
//  Created by Ronald Rivera on 11/18/20.
//

import UIKit
import Kingfisher

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImg1: UIImageView!
    @IBOutlet weak var categoryImg2: UIImageView!
    @IBOutlet weak var categoryImg3: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(genre: String, books: [Book]) {
        
        
        if books.count > 0, let  url1 = URL(string: "https" + books[0].smallThumbnail.dropFirst(4)) {
            categoryImg1.kf.setImage(with: url1)
        }
        
        if books.count > 1, let url2 = URL(string: "https" + books[1].smallThumbnail.dropFirst(4)) {
            categoryImg2.kf.setImage(with: url2)
        }
        
        if books.count > 2, let url3 = URL(string: "https" + books[2].smallThumbnail.dropFirst(4)) {
            categoryImg3.kf.setImage(with: url3)
        }
        
        categoryTitle.text = genre
    }

        
   override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
