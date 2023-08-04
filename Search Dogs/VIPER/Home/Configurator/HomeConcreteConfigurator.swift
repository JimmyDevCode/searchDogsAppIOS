//
//  HomeConcreteConfigurator.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//

import Foundation
import UIKit

//factory 
protocol HomeConfiguratorProtocol{
    
    func createRemoteAPI() -> RemoteAPIProtocol
    func createPresenter() -> HomePresenterProtocol
    func createInteractor(api: RemoteAPIProtocol, presenter: HomePresenterProtocol) -> HomeInteractorInputProtocol
    func createRouter()-> HomeRouterProtocol
}

class HomeConcreteConfigurator: HomeConfiguratorProtocol {

    func createRemoteAPI() -> RemoteAPIProtocol {
        let api = RemoteAPI()
        return api
    }
    
    func createPresenter() -> HomePresenterProtocol {
        let presenter = HomePresenter()
        return presenter
    }
    
    func createInteractor(api: RemoteAPIProtocol, presenter: HomePresenterProtocol) -> HomeInteractorInputProtocol {
        let interactor = HomeInteractor(api: api, presenter: presenter)
        return interactor
    }
    
    func createRouter() -> HomeRouterProtocol {
        let router = HomeRouter()
        return router
    }
}
