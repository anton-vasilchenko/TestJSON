//
//  AdaptedTableView.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import Foundation
import UIKit

class AdaptedTableView: UITableView {
    
    var viewModel: AdaptedViewModelInputProtocol?
    var cellFactory: AdaptedSectionFactoryProtocol? {
        didSet {
            cellFactory?.cellTypes.forEach({$0.register(self)})
        }
    }
    
    func setup() {
        self.dataSource = self
    }
    
}

extension AdaptedTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.sections.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.sections[section].cells.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cellFactory = cellFactory,
            let cellViewModel = viewModel?.sections[indexPath.section].cells[indexPath.row] else {
            return UITableViewCell()
        }
        
        return cellFactory.generateCell(viewModel: cellViewModel, tableView: tableView, for: indexPath)
    }
}
