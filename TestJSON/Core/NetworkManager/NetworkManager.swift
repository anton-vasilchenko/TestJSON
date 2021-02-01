//
//  NetworkManager.swift
//  TestJSON
//
//  Created by Антон Васильченко on 30.01.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func loadJSON(completion: @escaping ([PryanikyJSON]) -> Void) {
        
        guard let url = URL(string: "https://pryaniky.com/static/json/sample.json") else {return}
                
        
        AF.request(url).responseData { (response) in
            if let data = response.value {
                do {
                    let jsonResponse = try JSONDecoder().decode(PryanikyJSON.self, from: data)
                    completion([jsonResponse])
                } catch {
                    print(error)
//                    completion()
                }
            }
        }

    }
    
}
