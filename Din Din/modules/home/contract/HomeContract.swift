//
//  HomeContract.swift
//  Din Din
//
//  Created by Hein Aung on 16/07/2023.
//

// HomeView Contract
protocol HomeView : AnyObject{
    
}

// HomeInteractor Contract
protocol HomeInteractor {
    
}

// HomePresenter Contract
protocol HomePresenter {
    var view: HomeView? { get set }
    var interactor: HomeInteractor { get set }
    func handleItemClick()
}

// HomeRouter Contract
protocol HomeRouter {
    func navigateToProducts()
}
