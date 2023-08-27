//
//  AppsHeaderCell.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 16.03.2021.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Company name", font: UIFont(name: "Avenir-Book", size: 12)!)
    let titleLabel = UILabel(text: "This is the title and the long addition to it and more", font: UIFont(name: "Avenir", size: 20)!)
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        imageView.backgroundColor = .red
        titleLabel.numberOfLines = 2
        companyLabel.textColor = .blue
        let stackView = VerticalStackView(arangeSubviews: [companyLabel, titleLabel, imageView])
        
        addSubview(stackView)
        stackView.spacing = 10
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
