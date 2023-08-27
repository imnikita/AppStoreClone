//
//  AppDetailsController.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 24.03.2021.
//

import UIKit
import SDWebImage

class AppDetailsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let appId: String
    
    init(appId: String){
        self.appId = appId
        super .init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellID = "AppDetailCell"
    let previewCellID = "previewCellID"
    let reviewCell = "ratingsCell"
    
    var app: Result?
    var reviews: Reviews?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellID)
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: reviewCell)
        navigationItem.largeTitleDisplayMode = .never
        fetchData()
    }
    
    fileprivate func fetchData() {
        let safeURL = "http://itunes.apple.com/lookup?id=\(appId)"
        APIService.shared.fetchGenericJSONData(urlString: safeURL) { (result: SearchResult?, error) in
            self.app = result?.results.first
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        let safePreviewURL = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId)/sortby=mostrecent/json?l=en&cc=us"
        APIService.shared.fetchGenericJSONData(urlString: safePreviewURL) { (reviews: Reviews?, error) in
            if let error = error {
                print("Could not fetch reviews: ", error)
                return
            }
            self.reviews = reviews
            reviews?.feed.entry.forEach({print($0.rating.label)})
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppDetailCell
            cell.app = app
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellID, for: indexPath) as! PreviewCell
            cell.horizontalController.app = self.app
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCell, for: indexPath) as! ReviewRowCell
            cell.reviewsController.reviews = self.reviews
            
            return cell
        }
        

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 280
        
        if indexPath.item == 0 {
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.app = app
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            height = estimatedSize.height
        } else if indexPath.item == 1 {
            height = 500
        } else {
            height = 280
        }
        return .init(width: view.frame.width, height: height)
    }
    
}
