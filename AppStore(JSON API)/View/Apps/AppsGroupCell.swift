//
//  AppsGroupCell.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 15.03.2021.
//

import UIKit


class AppsGroupCell: UICollectionViewCell {
    
    var titleLabel = UILabel(text: "Apps Section", font: .boldSystemFont(ofSize: 30))
    
    let horisontalController = AppsHorisontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .red
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 5, left: 20, bottom: 7, right: 0))
        
        addSubview(horisontalController.view)
        horisontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
