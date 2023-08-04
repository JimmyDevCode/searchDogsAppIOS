//
//  HomePresenter.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//

import Foundation

protocol HomePresenterInputProtocol {
    
    func getDogs(page: Int)
    func searchDogs(text: String)
    func selectDog(dog: DogMapperResponse)
    
    var interactor: HomeInteractorInputProtocol? {get set}
    var router: HomeRouterProtocol? {get set}
}

protocol HomePresenterOuputProtocol: AnyObject {
    
    func getDogsResponse(dogs: [DogMapperResponse])
    func didReceiveSearchResults(dogs: [DogMapperResponse])
    var view: HomeViewProtocol? {get set}
    
}

protocol HomePresenterProtocol: HomePresenterInputProtocol, HomePresenterOuputProtocol {}

class HomePresenter: HomePresenterProtocol {
    
    var interactor: HomeInteractorInputProtocol?
    var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    
}

extension HomePresenter: HomePresenterInputProtocol {
    
    func searchDogs(text: String) {
        interactor?.searchDogs(text: text)
    }
    
    func getDogs(page: Int) {
        interactor?.getData(page: page)
    }
    func selectDog(dog: DogMapperResponse){
        router?.navigateToHomeDetail(dog: dog)
    }
}

extension HomePresenter: HomePresenterOuputProtocol{
    
    func getDogsResponse(dogs: [DogMapperResponse]) {
        DispatchQueue.main.async{
            self.view?.updateDataDogs(dogs: dogs)
        }
    }
    
    func didReceiveSearchResults(dogs: [DogMapperResponse]) {
        view?.updateDataDogsFiltered(dogs: dogs)
    }
}
