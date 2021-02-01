//
//  AdaptedViewModelInputProtocol.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import Foundation

protocol AdaptedCellViewModelProtocol { }

protocol AdaptedSectionViewModelProtocol {
    var cells: [AdaptedCellViewModelProtocol] { get }
}

protocol AdaptedViewModelInputProtocol {
    var sections: [AdaptedSectionViewModelProtocol] { get }
}

protocol AdaptedViewModelOutputProtocol {
    func didSelectRowAt(indexPath: IndexPath)
}

extension AdaptedViewModelOutputProtocol {
    func didSelectRowAt(indexPath: IndexPath) { }
}

typealias AdaptedSectionViewModelType = AdaptedViewModelInputProtocol & AdaptedViewModelOutputProtocol
