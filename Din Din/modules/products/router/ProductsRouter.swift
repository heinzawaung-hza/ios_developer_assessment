//
//  ProductsRouter.swift
//  Din Din
//
//  Created by Hein Aung on 16/07/2023.
//

import UIKit

class ProductsRouterImpl: ProductsRouter {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func navigateBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
