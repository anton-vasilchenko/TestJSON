//
//  JSONPictureCellViewModel.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import Foundation

protocol JSONPictureCellViewModelInputProtocol {
    var name: String { get }
    var text: String { get }
    var url: String { get }

}

typealias JSONPictureCellViewModelType = AdaptedCellViewModelProtocol & HZCellViewModelInputProtocol

class JSONPictureCellViewModel: JSONPictureCellViewModelType {
    
    var name: String
    var text: String
    var url: String

    
    init(name: String, text: String, url: String) {
        self.name = name
        self.text = text
        self.url = url
    }
}
