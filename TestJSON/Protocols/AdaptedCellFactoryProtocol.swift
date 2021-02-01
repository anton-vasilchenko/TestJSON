//
//  AdaptedCellFactoryProtocol.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import Foundation
import UIKit

protocol AdaptedCellFactoryProtocol {
    var cellTypes: [AdaptedCellProtocol.Type] { get }
    func generateCell (viewModel: AdaptedCellViewModelProtocol, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
}
