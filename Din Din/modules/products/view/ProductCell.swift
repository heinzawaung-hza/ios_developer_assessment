//
//  ProductCell.swift
//  Din Din
//
//  Created by Hein Aung on 17/07/2023.
//
import UIKit
import AlamofireImage

class ProductCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        return layoutAttributes
    }
    
    func configure(with product: ProductEntity) {
        titleLabel.text = product.title
        priceLabel.text = "$\(product.price)"
        descriptionLabel.text = product.description
        categoryLabel.text = "Category: \(product.category.rawValue.capitalized)"
        ratingLabel.text = "Rating: \(product.rating.rate) (\(product.rating.count) ratings)"
        
        if let url = URL(string: product.image) {
            productImageView.af.setImage(withURL: url)
        } else {
            productImageView.image = nil
        }
    }
}

