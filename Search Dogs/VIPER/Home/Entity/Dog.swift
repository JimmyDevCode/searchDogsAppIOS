//
//  Dog.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//

import Foundation

struct Dog: Codable {
    let breeds: [Breed]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case breeds
        case url
    }
    
}
