//
//  AppRowCell.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 16.03.2021.
//

import UIKit


class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)
    let nameLabel = UILabel(text: "APP NAME", font: UIFont(name: "AvenirNext-Medium", size: 20)!)
    let companyLabel = UILabel(text: "Company name", font: UIFont(name: "Avenir-Book", size: 15)!)
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 32 / 2
        getButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
        
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        imageView.backgroundColor = .purple
        
        let stackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView(arangeSubviews: [nameLabel, companyLabel], spacing: 4), getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        
        stackView.fillSuperview()
//        stackView.fillSuperview(padding: .init(top: 8, left: 8, bottom: 8, right: 8))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
