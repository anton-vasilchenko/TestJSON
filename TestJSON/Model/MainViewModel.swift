//
//  MainViewModel.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import Foundation
import UIKit

final class MainViewModel: AdaptedSectionViewModelType {
    
    // MARK: - Public properties
    
    var sections: [AdaptedSectionViewModelProtocol]
    var json: [PryanikyJSON] = []
    var blockItems: [String] = []
    let adaptedTableView = ViewController()
    
    
    
    
    // MARK: - Init
    
    init() {
        self.sections = []
        
        setupMainSection()
        
    }
    
    // MARK: - Private methods
    
   public func setupMainSection() {
        let networkManager = NetworkManager()
        networkManager.loadJSON { [weak self] (data) in
            guard let self = self else {return}
            self.json = data
            self.blockItems = self.json[0].view
//            self.adaptedTableView.
            let hzBlock = self.json[0].data.filter {$0.name == "hz"}
            let pictureBlock = self.json[0].data.filter {$0.name == "picture"}
            let selectorBlock = self.json[0].data.filter {$0.name == "selector"}
            
            let section = AdaptedSectionViewModel(cells: [
                HZCellViewModel(name: hzBlock[0].name, text: hzBlock[0].data.text!),
                SelectorCellViewModel(name: selectorBlock[0].name, text: selectorBlock[0].data.variants![selectorBlock[0].data.selectedID!].text, selectedID: selectorBlock[0].data.selectedID!, id: selectorBlock[0].data.variants![(selectorBlock[0].data.selectedID!) - 1].id),
                JSONPictureCellViewModel(name: pictureBlock[0].name, text: pictureBlock[0].data.text!, url: pictureBlock[0].data.url!)
            ])
            self.sections.append(section)

        }
//    self.adaptedTableView.tableView.reloadData()
    }
    
}
