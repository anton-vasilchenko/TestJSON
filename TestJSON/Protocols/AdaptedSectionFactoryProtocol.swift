//
//  AdaptedSectionFactoryProtocol.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import Foundation
import UIKit

protocol AdaptedSectionFactoryProtocol {
    var cellTypes: [AdaptedCellProtocol.Type] { get }
    func registerAllCells(_ tableView: UITableView)
    func generateCell(viewModel: AdaptedCellViewModelProtocol, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
    func generateSection(viewModel: AdaptedSectionHeaderViewModelProtocol) -> UIView?
}

extension AdaptedSectionFactoryProtocol {
    
    func registerAllCells(_ tableView: UITableView) {
        cellTypes.forEach({ $0.register(tableView) })
    }
    
}
