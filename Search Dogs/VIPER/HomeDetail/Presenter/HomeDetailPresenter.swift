//
//  Presenter.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 2/08/23.
//

import Foundation


protocol HomeDetailPresenterprotocol{
    
    func getDetail()
}

class HomeDetailPresenter: HomeDetailPresenterprotocol {
    
    private var dogDetail: DogMapperResponse
    
    weak var view: HomeViewDetailProtocol?
    
    func getDetail() {
        view?.updateDetailDog(detailDog: dogDetail)
    }

    required init (dogDetail: DogMapperResponse, view: HomeViewDetailProtocol){
        self.dogDetail = dogDetail
        self.view = view
    }
    
}
