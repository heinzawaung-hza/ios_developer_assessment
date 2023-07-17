//
//  ProductsPresenter.swift
//  Din Din
//
//  Created by Hein Aung on 16/07/2023.
//
import Foundation
import RxSwift


class ProductsPresenterImpl: ProductsPresenter {
    weak var view: ProductsView?
    var interactor: ProductsInteractor
    var router: ProductsRouter
    private let disposeBag = DisposeBag()
    
    init(view: ProductsView, interactor: ProductsInteractor, router: ProductsRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.displayLoading()
        interactor.fetchProducts()
            .subscribe(onNext: { [weak self] products in
                self?.view?.hideLoading()
                self?.view?.displayProducts(products)
            }, onError: { [weak self] error in
                self?.view?.hideLoading()
                // Handle error
            })
            .disposed(by: disposeBag)
    }
}

