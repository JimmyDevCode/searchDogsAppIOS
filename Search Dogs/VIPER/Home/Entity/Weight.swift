//
//  Weight.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//

import Foundation

struct Weight: Codable{
    let kilogram: String
    
    enum CodingKeys: String, CodingKey{
        case kilogram = "metric"
    }
    init(kilogram: String){
        self.kilogram = kilogram
    }
}
