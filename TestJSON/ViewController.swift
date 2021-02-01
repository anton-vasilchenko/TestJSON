//
//  ViewController.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: AdaptedTableView! {
        didSet {
            tableView.viewModel = MainViewModel()
            tableView.cellFactory = MainSectionFactory()
            
            tableView.setup()
            
        }
    }
    
}
