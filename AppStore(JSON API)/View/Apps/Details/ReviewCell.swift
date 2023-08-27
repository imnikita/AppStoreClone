//
//  ReviewCell.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 28.03.2021.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Review title", font: .boldSystemFont(ofSize: 20))
    let authorLabel = UILabel(text: "Author name", font: .systemFont(ofSize: 18))
    let starLabel = UILabel(text: "Star", font: .systemFont(ofSize: 16))
    
    let starStackView: UIStackView = {
        var arrangedSubviews = [UIView]()
        (0..<5).forEach { (_) in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.constrainWidth(constant: 24)
            imageView.constrainHeight(constant: 24)
            arrangedSubviews.append(imageView)
        }
        arrangedSubviews.append(UIView())
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        
        return stackView
    }()
    
    let bodyLabel = UILabel(text: "Review text\nReview text\nReview text\nReview text", font: .systemFont(ofSize: 16), numberOfLines: 5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
        clipsToBounds = true
        
        
        
        let stackView = VerticalStackView(arangeSubviews: [UIStackView(arrangedSubviews: [titleLabel, authorLabel], customSpacing: 8), starStackView, bodyLabel], spacing: 16 )
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        authorLabel.textAlignment = .right
        addSubview(stackView)
//        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
