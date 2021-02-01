//
//  PryanikyJSON.swift
//  TestJSON
//
//  Created by Антон Васильченко on 29.01.2021.
//

import Foundation
//import SwiftyJSON

//class PryanikyJSON: Decodable {
//    
//    var view: [String] = []
//    var name: String?
//    var text: String?
//    var id: Int?
//    var url: String?
//    var selectedId: Int?
//    var varText: String?
//    
////    init(json: JSON) {
////        self.view = json["view"].arrayValue.map {$0.stringValue}
//////        self.name = json["data"]
////    }
//    
//    enum CodingKeys: String, CodingKey {
//        case view
//        case data
//    }
//
//    enum DataKeys: String, CodingKey {
//        case name
//        case internalData = "data"
//    }
//
//    enum InternalDataKeys: String, CodingKey {
//        case text
//        case url
//        case selectedId
//        case variants
//    }
//
//    enum VariantKeys: String, CodingKey {
//        case id
//        case varText = "text"
//    }
//
//    convenience required init(from decoder: Decoder) throws {
//        self.init()
//
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        self.view = try values.decode([String].self, forKey: .view)
//
//        var dataArrayContainer = try values.nestedUnkeyedContainer(forKey: .data)
//        let dataValues = try dataArrayContainer.nestedContainer(keyedBy: DataKeys.self)
//        self.name = try dataValues.decode(String.self, forKey: .name)
//
////        var internalDataArrayContainer = try values.nestedUnkeyedContainer(forKey: .data)
//        let internalDataValues = try dataValues.nestedContainer(keyedBy: InternalDataKeys.self, forKey: .internalData)
//        self.text = try internalDataValues.decode(String.self, forKey: .text)
////        self.url = try internalDataValues.decode(String.self, forKey: .url) ?? ""
////        self.selectedId = try internalDataValues.decode(Int.self, forKey: .selectedId) ?? 0
//        
//        var variantsArrayContainer = try internalDataValues.nestedUnkeyedContainer(forKey: .variants)
//        let variantsValues = try variantsArrayContainer.nestedContainer(keyedBy: VariantKeys.self)
//        self.id = try variantsValues.decode(Int.self, forKey: .id)
//        self.varText = try variantsValues.decode(String.self, forKey: PryanikyJSON.VariantKeys(rawValue: varText!)!)
//
//
//
//
//    }
//    
//}



//import SwiftyJSON
//
//final class PryanikyJSON: Codable {
//    var data:
//    var view: [String]
//}
//
//enum DataType: String {
//    case text = "hz"
//    case picture
//    case selector
//}

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
