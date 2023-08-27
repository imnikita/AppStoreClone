//
//  ReviewRowCell.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 28.03.2021.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewsController = ReviewsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .blue
        addSubview(reviewsController.view)
        reviewsController.view.fillSuperview(padding: .init(top: 0, left: 0, bottom: 12, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
