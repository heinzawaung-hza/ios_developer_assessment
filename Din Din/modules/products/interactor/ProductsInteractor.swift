//
//  ProductsInteractor.swift
//  Din Din
//
//  Created by Hein Aung on 16/07/2023.
//

import Foundation
import Alamofire
import RxSwift

class ProductsInteractorImpl: ProductsInteractor {
    
    func fetchProducts() -> Observable<[ProductEntity]> {
        return Observable.create { observer in
            let request = AF.request("https://fakestoreapi.com/products")
                .validate()
                .responseDecodable(of: [ProductEntity].self) { response in
                    switch response.result {
                    case .success(let products):
                        observer.onNext(products)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
