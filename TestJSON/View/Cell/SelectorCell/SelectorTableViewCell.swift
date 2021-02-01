//
//  SelectorTableViewCell.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import UIKit

class SelectorTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var selectedIDLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var dataTextLabel: UILabel!
    
    var viewModel: SelectorCellViewModelInputProtocol? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        nameLabel.text = viewModel?.name
        dataTextLabel.text = viewModel?.text
        selectedIDLabel.text = String(viewModel!.selectedID)
        idLabel.text =  String(viewModel!.id)
    }

    
}
