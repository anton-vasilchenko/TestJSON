//
//  SelectorCellViewModel.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import Foundation

protocol SelectorCellViewModelInputProtocol {
    var name: String { get }
    var text: String { get }
    var selectedID: Int { get }
    var id: Int { get }
}

typealias SelectorCellViewModelType = AdaptedCellViewModelProtocol & HZCellViewModelInputProtocol

class SelectorCellViewModel: SelectorCellViewModelType {
    
    var name: String
    var text: String
    var selectedID: Int
    var id: Int
    
    init(name: String, text: String, selectedID: Int, id: Int) {
        self.name = name
        self.text = text
        self.selectedID = selectedID
        self.id = id
    }
}
