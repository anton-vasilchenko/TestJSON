//
//  JSONPictureTableViewCell.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import UIKit
import Kingfisher

class JSONPictureTableViewCell: UITableViewCell, AdaptedCellProtocol {

    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    
    var viewModel: JSONPictureCellViewModelInputProtocol? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        firstLabel.text = viewModel?.name
        secondLabel.text = viewModel?.text
        thirdLabel.text = viewModel?.url
//        pictureView.kf.setImage(with: viewModel?.url)
//        pictureView.kf.setImage(with: viewModel?.url)

    }
    
}
