//
//  Height.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//

import Foundation

struct Heigh: Codable {
    let centimeter: String
    
    enum CodingKeys: String, CodingKey {
        case centimeter = "metric"
    }
    init(centimeter: String){
        self.centimeter = centimeter
    }
}
