//
//  HomeDetailConfigurator.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 2/08/23.
//

import Foundation
import UIKit

class HomeDetailConfigurator {
    
    static func createModuleDetail(with dog: DogMapperResponse) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewDetailController") as! HomeViewDetailController
        let presenter =  HomeDetailPresenter(dogDetail: dog, view: view)
       
        view.presenter = presenter
        return view
    }
   
}



