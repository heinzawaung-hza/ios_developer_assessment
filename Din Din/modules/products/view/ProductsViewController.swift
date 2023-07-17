//
//  ProductsViewController.swift
//  Din Din
//
//  Created by Hein Aung on 16/07/2023.
//
import UIKit

class ProductsViewController: UIViewController  {
    
    var presenter: ProductsPresenter!
    
    private var products: [ProductEntity] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let router = ProductsRouterImpl(viewController: self)
        let interactor = ProductsInteractorImpl()
        presenter = ProductsPresenterImpl(view: self, interactor: interactor, router: router)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        let itemSpacing: CGFloat = 10
        let itemWidth = (collectionView.bounds.width - itemSpacing) / 2
        layout.itemSize = CGSize(width: itemWidth, height: 250)
        layout.minimumInteritemSpacing = itemSpacing
        layout.minimumLineSpacing = itemSpacing
        collectionView.collectionViewLayout = layout
        
        presenter.viewDidLoad()
    }
    
}

extension ProductsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let product = products[indexPath.item]
        
        cell.configure(with: product)
        
        return cell
    }
}

extension ProductsViewController : UICollectionViewDelegate {
}

extension ProductsViewController: ProductsView {
    func hideLoading() {
        loadingView.isHidden = true
        collectionView.isHidden = false
    }
    
    func displayLoading() {
        loadingView.isHidden = false
        collectionView.isHidden = true
    }
    
    func displayProducts(_ products: [ProductEntity]) {
        self.products = products
        collectionView.reloadData()
    }
}

