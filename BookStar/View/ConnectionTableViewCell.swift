//
//  ConnectionTableViewCell.swift
//  BookStar
//
//  Created by Ron Rivera on 4/13/22.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class ConnectionTableViewCell: UITableViewCell {

    @IBOutlet weak var connectionImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(connection: Connection) {
        connectionImageView.image = connection.connection
        usernameLabel.text = connection.username
        bioLabel.text = connection.bio
    }
    
     func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       // Reuse or create a cell of the appropriate type.
       let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionsCellType",
                             for: indexPath) as! ConnectionTableViewCell

       // Fetch the data for the row.
       let theFood = connectionImageView[indexPath.row]
            
       // Configure the cell’s contents with data from the fetched object.
       cell.name?.text = theFood.name
       cell.plantDescription?.text = theFood.description
       cell.picture?.image = theFood.picture
            
       return cell
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
