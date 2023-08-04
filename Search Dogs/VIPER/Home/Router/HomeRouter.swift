//
//  HomeRouter.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 2/08/23.
//

import Foundation
import UIKit

protocol HomeRouterProtocol {
    
    func navigateToHomeDetail(dog: DogMapperResponse)
    var view: UIViewController? { get set }
}

class HomeRouter: HomeRouterProtocol{
  
    weak var view: UIViewController?
    func navigateToHomeDetail(dog: DogMapperResponse) {
        let detailModule = HomeDetailConfigurator.createModuleDetail(with: dog)
        view?.navigationController?.pushViewController(detailModule, animated: true)
    }
    
}
