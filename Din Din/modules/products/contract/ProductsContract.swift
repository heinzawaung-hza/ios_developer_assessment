//
//  ProductsContract.swift
//  Din Din
//
//  Created by Hein Aung on 16/07/2023.
//
import Foundation
import RxSwift

protocol ProductsView: AnyObject {
    func displayLoading()
    func hideLoading()
    func displayProducts(_ products: [ProductEntity])
}

protocol ProductsInteractor {
    func fetchProducts() -> Observable<[ProductEntity]>
}

protocol ProductsPresenter {
    func viewDidLoad()
}

protocol ProductsRouter {
    func navigateBack()
}
