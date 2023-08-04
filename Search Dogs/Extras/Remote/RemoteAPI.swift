//
//  RemoteAPI.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//


import Foundation
import Alamofire

protocol RemoteAPIProtocol{
    
    func getDataFromAPI(page: Int, completion: @escaping ([Dog]) -> Void)
    
}

class RemoteAPI: RemoteAPIProtocol {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func getDataFromAPI(page: Int, completion: @escaping ([Dog]) -> Void) {
        
        let itemsPerPage = 10
        let offset = page * itemsPerPage
        
        let apiUrl = "https://api.thedogapi.com/v1/images/search?limit=\(itemsPerPage)&has_breeds=true&page=\(offset)"
        let YOUR_API_KEY = ""
        let headers: HTTPHeaders = ["x-api-key": YOUR_API_KEY]
        
        AF.request(apiUrl, headers: headers).responseDecodable(of: [Dog].self) { response in
            switch response.result {
            case .success(let dogDataArray):
             
                completion(dogDataArray)
            case .failure(let error):
                print("Error fetching data: \(error)")
               
                completion([])
            }
        }
    }
}



