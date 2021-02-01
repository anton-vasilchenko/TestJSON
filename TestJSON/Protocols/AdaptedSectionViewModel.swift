//
//  AdaptedSectionViewModel.swift
//  TestJSON
//
//  Created by Антон Васильченко on 01.02.2021.
//

import Foundation
import Combine

class AdaptedSectionViewModel: AdaptedSectionViewModelProtocol {
    
    // MARK: - Public properties
    
    var header: AdaptedSectionHeaderViewModelProtocol?
    var footer: AdaptedSectionHeaderViewModelProtocol?
    var cells: [AdaptedCellViewModelProtocol] {
        didSet {
            reloadDataSubject.send()
        }
    }
    
    var reloadDataPublisher: AnyPublisher<Void, Never> {
        reloadDataSubject.eraseToAnyPublisher()
    }
    
    // MARK: - Private properties
    
    private let reloadDataSubject: PassthroughSubject<Void, Never>
    
    // MARK: - Init
    
    init(header: AdaptedSectionHeaderViewModelProtocol? = nil,
         footer: AdaptedSectionHeaderViewModelProtocol? = nil,
         cells: [AdaptedCellViewModelProtocol]) {
        self.header = header
        self.footer = footer
        self.cells = cells
        self.reloadDataSubject = PassthroughSubject<Void, Never>()
    }
    
}

protocol AdaptedSectionHeaderViewModelProtocol { }


