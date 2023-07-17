//
//  ProductsEntity.swift
//  Din Din
//
//  Created by Hein Aung on 16/07/2023.
//

import Foundation

struct ProductEntity: Codable, Equatable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    let image: String
    let rating: Rating
    
    static func == (lhs: ProductEntity, rhs: ProductEntity) -> Bool {
        return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.price == rhs.price &&
        lhs.description == rhs.description &&
        lhs.category == rhs.category &&
        lhs.image == rhs.image &&
        lhs.rating == rhs.rating
    }
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

struct Rating: Codable {
    let rate: Double
    let count: Int
    
    static func == (lhs: Rating, rhs: Rating) -> Bool {
        return lhs.rate == rhs.rate &&
        lhs.count == rhs.count
    }
}


