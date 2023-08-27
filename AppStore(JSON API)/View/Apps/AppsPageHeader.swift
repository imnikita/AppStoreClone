//
//  AppsPageHeader.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 16.03.2021.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    let appHeaderHorisontalController = AppsHeaderHorisontalController()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appHeaderHorisontalController.view)
        appHeaderHorisontalController.view.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
