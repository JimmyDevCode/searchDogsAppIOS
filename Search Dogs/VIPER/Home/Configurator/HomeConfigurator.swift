//
//  HomeFactory.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//

import Foundation
import UIKit


class HomeConfigurator {
    
    static func createModuleHome(view: HomeViewController){
        
        let factory: HomeConfiguratorProtocol
        let configurate = HomeConcreteConfigurator()
        
        factory = configurate
        
        var presenter = factory.createPresenter()
        
        var router = factory.createRouter()
        let api = factory.createRemoteAPI()
        
        let interactor = factory.createInteractor(api: api, presenter: presenter)
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        view.presenter = presenter
        
        //the roouter needs an instance of the current view that builds it, because it is the one that starts navigation
        router.view = view
    }
}
