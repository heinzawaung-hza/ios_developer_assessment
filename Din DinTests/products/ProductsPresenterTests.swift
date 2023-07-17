//
//  ProductsPresenterTests.swift
//  Din DinTests
//
//  Created by Hein Aung on 17/07/2023.
//
import XCTest
import RxSwift

@testable import Din_Din

class MockProductsView: ProductsView {
    var loadingDisplayed = false
    var loadingHidden = false
    
    var displayedProducts: [ProductEntity] = []
    
    func displayLoading() {
        loadingDisplayed = true
    }
    
    func hideLoading() {
        loadingHidden = true
    }
    
    func displayProducts(_ products: [ProductEntity]) {
        displayedProducts = products
    }
}

class MockProductsInteractor: ProductsInteractor {
    var fetchProductsCalled = false
    
    func fetchProducts() -> Observable<[ProductEntity]> {
        fetchProductsCalled = true
        let p1 = ProductEntity(id: 1, title: "Product 1", price: 20, description: "Test Description", category: .electronics, image: "Test Image", rating: Rating(rate: 4, count: 20))
        let p2 = ProductEntity(id: 1, title: "Product 2", price: 10, description: "Test Description2", category: .electronics, image: "Test Image2", rating: Rating(rate: 3, count: 10))
        return Observable.just([p1,p2])
    }
}

class ProductsPresenterImplTests: XCTestCase {
    var presenter: ProductsPresenterImpl!
    var mockView: MockProductsView!
    var mockInteractor: MockProductsInteractor!
    var mockRouter: ProductsRouter!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        mockView = MockProductsView()
        mockInteractor = MockProductsInteractor()
        mockRouter = ProductsRouterImpl(viewController: nil)
        presenter = ProductsPresenterImpl(view: mockView, interactor: mockInteractor, router: mockRouter)
        disposeBag = DisposeBag()
    }
    
    override func tearDown() {
        presenter = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        disposeBag = nil
        super.tearDown()
    }
    
    func testViewDidLoad() {
        presenter.viewDidLoad()
        
        XCTAssertTrue(mockView.loadingDisplayed, "Loading should be displayed")
        XCTAssertTrue(mockInteractor.fetchProductsCalled, "fetchProducts() should be called")
        
        // Simulate products being fetched
        let p1 = ProductEntity(id: 1, title: "Product 1", price: 20, description: "Test Description", category: .electronics, image: "Test Image", rating: Rating(rate: 4, count: 20))
        let p2 = ProductEntity(id: 1, title: "Product 2", price: 10, description: "Test Description2", category: .electronics, image: "Test Image2", rating: Rating(rate: 3, count: 10))
        let products = [p1,p2]
        mockInteractor.fetchProductsCalled = false
        
        let fetchProductsSubject = PublishSubject<[ProductEntity]>()
        
        fetchProductsSubject.onNext(products)
        
        XCTAssertTrue(mockView.loadingHidden, "Loading should be hidden")
        XCTAssertEqual(mockView.displayedProducts, products, "Correct products should be displayed")
    }
}
