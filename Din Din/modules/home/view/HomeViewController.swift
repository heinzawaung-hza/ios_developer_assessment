//
//  HomeViewController.swift
//  Din Din
//
//  Created by Hein Aung on 16/07/2023.
//

import UIKit

class HomeViewController: UIViewController  {
    var presenter: HomePresenter!
    @IBOutlet weak var aboutMe: UIView!
    @IBOutlet weak var orders: UIView!
    @IBOutlet weak var favourites: UIView!
    
    @IBOutlet weak var categories: UIView!
    @IBOutlet weak var address: UIView!
    @IBOutlet weak var creditCard: UIView!
    @IBOutlet weak var transactions: UIView!
    @IBOutlet weak var notifications: UIView!
    @IBOutlet weak var signout: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let router = HomeRouterImpl(viewController: self)
        let interactor = HomeInteractorImpl()
        presenter = HomePresenterImpl(view: self, interactor: interactor, router: router)
        
        let aboutMeGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        aboutMe.addGestureRecognizer(aboutMeGesture)
        
        let ordersGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        orders.addGestureRecognizer(ordersGesture)
        
        let favouritesGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        favourites.addGestureRecognizer(favouritesGesture)
        
        let categoriesGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        categories.addGestureRecognizer(categoriesGesture)
        
        let addressGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        address.addGestureRecognizer(addressGesture)
        
        let creditCardGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        creditCard.addGestureRecognizer(creditCardGesture)
        
        let transactionsGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        transactions.addGestureRecognizer(transactionsGesture)
        
        let notificationsGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        notifications.addGestureRecognizer(notificationsGesture)
        
        let signoutGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        signout.addGestureRecognizer(signoutGesture)
    
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        presenter.handleItemClick()
    }
    
}

extension HomeViewController: HomeView {
    
}
