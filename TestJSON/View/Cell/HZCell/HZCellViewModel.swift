//
//  HZCellViewModel.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import Foundation

protocol HZCellViewModelInputProtocol {
    var name: String { get }
    var text: String { get }
}

typealias HZCellViewModelType = AdaptedCellViewModelProtocol & HZCellViewModelInputProtocol

class HZCellViewModel: HZCellViewModelType {
    
    var name: String
    var text: String
    
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
}
