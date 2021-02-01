//
//  HZTableViewCell.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import UIKit

final class HZTableViewCell: UITableViewCell, AdaptedCellProtocol {
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var dataText: UILabel!
    
    var viewModel: HZCellViewModelInputProtocol? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        name.text = viewModel?.name
        dataText.text = viewModel?.text
    }

    
}
