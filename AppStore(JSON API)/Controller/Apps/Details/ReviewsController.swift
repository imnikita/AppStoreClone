//
//  ReviewsController.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 28.03.2021.
//

import UIKit

class ReviewsController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    var reviews: Reviews? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.contentInset = .init(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews?.feed.entry.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ReviewCell
        let review = reviews?.feed.entry[indexPath.item]
        cell.bodyLabel.text = review?.content.label
        cell.authorLabel.text = review?.author.name.label
        cell.titleLabel.text = review?.title.label
        for (index, view) in cell.starStackView.arrangedSubviews.enumerated() {
            if let ratingInt = Int(review!.rating.label) {
                view.alpha = index >= ratingInt ? 0 : 1
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width - 48, height: view.frame.height)
    }
}
