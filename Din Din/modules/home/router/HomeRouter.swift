//
//  HomeRouter.swift
//  Din Din
//
//  Created by Hein Aung on 16/07/2023.
//

import UIKit

class HomeRouterImpl: HomeRouter {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigateToProducts() {
        let productsStoryboard = UIStoryboard(name: "ProductsStoryboard", bundle: nil)
        let productsViewController = productsStoryboard.instantiateInitialViewController() as? ProductsViewController
        
        viewController?.navigationController?.pushViewController(productsViewController!, animated: true)
        
    }
}
