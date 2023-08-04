//
//  Dog.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//

import Foundation

struct Breed: Codable {
    let id: Int
    let name: String
    let bredFor: String?
    let breedGroup: String
    var lifeSpan: String
    let temperament: String?
    let weight: Weight
    let height: Heigh
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case bredFor = "bred_for"
        case breedGroup = "breed_group"
        case lifeSpan = "life_span"
        case temperament
        case weight
        case height
    }
    
    init(id:Int, name: String, bredFor: String? = nil, breedGroup: String, lifeSpan: String, temperament: String? = nil, weight: Weight, height: Heigh) {
        self.id = id
        self.name = name
        self.bredFor = bredFor
        self.breedGroup = breedGroup
        self.lifeSpan = lifeSpan
        self.temperament = temperament
        self.weight = weight
        self.height = height
    }
}
