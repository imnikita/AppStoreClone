//
//  HorizontalSnappingController.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 23.03.2021.
//

import UIKit


class HorizontalSnappingController: UICollectionViewController {
    
    init() {
        let layout = SmallSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

