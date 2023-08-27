//
//  VerticalStackView.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 14.03.2021.
//

import UIKit

class VerticalStackView: UIStackView {

    init(arangeSubviews: [UIView], spacing: CGFloat = 0){
        super.init(frame: .zero)
        
        arangeSubviews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = .vertical
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
