//
//  BaseListController.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 15.03.2021.
//

import UIKit

class BaseListController: UICollectionViewController{
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


