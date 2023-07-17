//
//  HomePresenter.swift
//  Din Din
//
//  Created by Hein Aung on 16/07/2023.
//

import Foundation

class HomePresenterImpl: HomePresenter {
    weak var view: HomeView?
    var interactor: HomeInteractor
    var router: HomeRouter
    
    init(view: HomeView, interactor: HomeInteractor, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // Implement HomePresenter methods
    
    func handleItemClick() {
        router.navigateToProducts()
    }
}
