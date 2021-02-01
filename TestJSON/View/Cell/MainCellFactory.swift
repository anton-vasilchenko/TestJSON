//
//  MainCellFactory.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import Foundation
import UIKit

struct MainSectionFactory: AdaptedSectionFactoryProtocol {
    var cellTypes: [AdaptedCellProtocol.Type] = [
        HZTableViewCell.self
    ]
    
    func generateCell(viewModel: AdaptedCellViewModelProtocol, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        switch viewModel {
        case let viewModel as HZCellViewModelType:
            let view = HZTableViewCell.reuse(tableView, for: indexPath)
            view.viewModel = viewModel
            return view
        default:
            return UITableViewCell()
        }
    }
    
    func generateSection(viewModel: AdaptedSectionHeaderViewModelProtocol) -> UIView? {
        nil
    }
    
    
}
