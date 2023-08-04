//
//  DogMapper.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//

import Foundation

struct DogMapperResponse {
    var id: Int
    var name: String
    var bredFor: String
    var breedGroup: String
    var lifeSpan: String
    var temperament: String
    var weight: String
    var height: String
    var url: String
    
    static func convertEntityToMapper(_ dogs: [Dog]) -> [DogMapperResponse] {
        return dogs.map { dogData in
            
            let breed = dogData.breeds.first
            
            let name = breed?.name ?? ""
            let breedFor = breed?.bredFor ?? "Not Information"
            let breedGroup = breed?.breedGroup ?? ""
            
            let lifeSpan = breed?.lifeSpan ?? ""
            let lifeSpanFormatter = lifeSpan.removeWordFromText(inputText: lifeSpan, textToReplace: "years")
            let temperament = breed?.temperament ?? ""
            let weight = breed?.weight.kilogram ?? ""
            let height = breed?.height.centimeter ?? ""
            
            return DogMapperResponse(id: breed?.id ?? 0,
                                     name: name,
                                     bredFor: breedFor,
                                     breedGroup: breedGroup,
                                     lifeSpan: lifeSpanFormatter,
                                     temperament: temperament,
                                     weight: "\(weight) Kg",
                                     height: "\(height) Cm",
                                     url: dogData.url)
        }
    }
}
