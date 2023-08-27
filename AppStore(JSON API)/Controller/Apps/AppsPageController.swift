//
//  AppsController.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 15.03.2021.
//

import UIKit


class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout{
    
    private let cellID = "id"
    private let headerID = "headerid"
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        
        fetchData()
        
    }
    
    var socialApps = [SocialApps]()
    var group = [AppGroup]()
    
    private func fetchData(){
        
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        APIService.shared.fetchNewGamesWeLove { (appGroup, error) in
//            print("Done with fetching new games...")
            dispatchGroup.leave()
            group1 = appGroup
        }
        
        dispatchGroup.enter()
        APIService.shared.fetchTopGrossing { (appGroup, error) in
//            print("Done with fetching top grossing...")
            dispatchGroup.leave()
            group2 = appGroup
        }
        
        dispatchGroup.enter()
        APIService.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json") { (appGroup, error) in
//            print("Done with fetching top free...")
            dispatchGroup.leave()
            group3 = appGroup
        }
        
        dispatchGroup.enter()
        APIService.shared.fetchSocialApps { (apps, error) in
            if let error = error{
                print("Error with fetching social apps: ", error)
                return
            }
            dispatchGroup.leave()
            self.socialApps = apps ?? []
        }
        
        dispatchGroup.notify(queue: .main) {
            self.activityIndicatorView.stopAnimating()
            if let group = group1{
                self.group.append(group)
            }
            if let group = group2{
                self.group.append(group)
            }
            if let group = group3{
                self.group.append(group)
            }
            self.collectionView.reloadData()
        }
        
    }
    
    // MARK: - Header methods
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! AppsPageHeader
        header.appHeaderHorisontalController.socialApps = socialApps
        header.appHeaderHorisontalController.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    
    
    // MARK: - Cells' methods
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return group.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsGroupCell
        let appGroup = group[indexPath.item]
        cell.titleLabel.text = appGroup.feed.title
        cell.horisontalController.appGroup = appGroup
        cell.horisontalController.collectionView.reloadData()
        cell.horisontalController.didSelectHandler = { [weak self] feedResult in
            let vc = AppDetailsController(appId: feedResult.id)  
            vc.navigationItem.title = feedResult.name
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
}
