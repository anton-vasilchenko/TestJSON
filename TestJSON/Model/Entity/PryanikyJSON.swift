//
//  PryanikyJSON.swift
//  TestJSON
//
//  Created by Антон Васильченко on 29.01.2021.
//

import Foundation

class PryanikyJSON: Decodable {
    let data: [Datum]
        let view: [String]

        init(data: [Datum], view: [String]) {
            self.data = data
            self.view = view
        }
}

class Datum: Decodable {
    let name: String
    let data: DataClass

    init(name: String, data: DataClass) {
        self.name = name
        self.data = data
    }
}

// MARK: - DataClass
class DataClass: Decodable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?

    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
    }

    init(text: String?, url: String?, selectedID: Int?, variants: [Variant]?) {
        self.text = text
        self.url = url
        self.selectedID = selectedID
        self.variants = variants
    }
}

// MARK: - Variant
class Variant: Decodable {
    let id: Int
    let text: String

    init(id: Int, text: String) {
        self.id = id
        self.text = text
    }
}
