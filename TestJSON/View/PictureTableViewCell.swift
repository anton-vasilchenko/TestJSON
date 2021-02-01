//
//  PictureTableViewCell.swift
//  TestJSON
//
//  Created by Антон Васильченко on 31.01.2021.
//

import UIKit
import Kingfisher

class PictureTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
