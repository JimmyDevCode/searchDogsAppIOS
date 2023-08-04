//
//  HomeInteractor.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//

import Foundation

protocol HomeInteractorInputProtocol{
    func getData(page: Int)
    func searchDogs(text: String)
}

class HomeInteractor {
    
    var api: RemoteAPIProtocol?
    weak var presenter: HomePresenterOuputProtocol?
    private var originalDogs: [DogMapperResponse] = []
    private var filteredDogs: [DogMapperResponse] = []
    
    required init(api: RemoteAPIProtocol, presenter: HomePresenterProtocol) {
        self.api = api
        self.presenter = presenter
    }
}

extension HomeInteractor: HomeInteractorInputProtocol {
    
    func searchDogs(text: String) {
        if text == "" {
            presenter?.didReceiveSearchResults(dogs: originalDogs)
        }else {
            let filteredDogs = originalDogs.filter{
                dog in return dog.name.lowercased().contains(text.lowercased())
            }
            presenter?.didReceiveSearchResults(dogs: filteredDogs)
        }
    }
    
    func getData(page: Int) {
        fetchDataFromAPI(page: page){[weak self] response in
            self?.originalDogs.append(contentsOf: response)
            
            DispatchQueue.main.async {
                self?.presenter?.getDogsResponse(dogs: self?.originalDogs ?? [])
            }
        }
    }
    
    private func fetchDataFromAPI(page: Int, completion: @escaping ([DogMapperResponse]) -> Void) {
        api?.getDataFromAPI(page: page) { dog in
            if !dog.isEmpty {
                let response = DogMapperResponse.convertEntityToMapper(dog)
                completion(response)
            } else {
                print("Data is empty")
            }
        }
    }
    
}
