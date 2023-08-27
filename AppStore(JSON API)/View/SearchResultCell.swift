//
//  SearchResultCell.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 14.03.2021.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet{
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingsLabel.text = "Rating: \(appResult.averageUserRating?.roundToPlaces(places: 1) ?? 0)"
            appIconImageView.sd_setImage(with: URL(string: appResult.artworkUrl100))
            screenshotImageView1.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            if appResult.screenshotUrls.count > 1{
                screenshotImageView2.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            if appResult.screenshotUrls.count > 2{
                screenshotImageView3.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
  
    let nameLabel = UILabel(text: "APP NAME", font: UIFont(name: "AvenirNext-Medium", size: 17)!)
    
//    let nameLabel: UILabel = {
//        let nameLbl = UILabel()
//        nameLbl.text = "APP NAME"
//        nameLbl.font = UIFont(name: "AvenirNext-Medium", size: 17)
//        return nameLbl
//    }()
        
    
    let categoryLabel: UILabel = {
        let nameLbl = UILabel()
        nameLbl.text = "Category Name"
        nameLbl.font = UIFont(name: "Avenir-Book", size: 15)
        return nameLbl
    }()
    
    let ratingsLabel: UILabel = {
        let nameLbl = UILabel()
        nameLbl.text = "9.26M"
        nameLbl.font = UIFont(name: "Avenir-Book", size: 15)
        return nameLbl
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 17
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return button
        
    }()
    
    lazy var screenshotImageView1 = self.createScreenshotImageView()
    lazy var screenshotImageView2 = self.createScreenshotImageView()
    lazy var screenshotImageView3 = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView{
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        
        let infoTopStackView = UIStackView(arrangedSubviews: [appIconImageView, VerticalStackView(arangeSubviews: [nameLabel, categoryLabel, ratingsLabel]), getButton])
        infoTopStackView.alignment = .center
        infoTopStackView.spacing = 15
        
        let screenshotsStackView = UIStackView(arrangedSubviews: [screenshotImageView1, screenshotImageView2, screenshotImageView3])
        screenshotsStackView.spacing = 15
        screenshotsStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arangeSubviews: [infoTopStackView, screenshotsStackView], spacing: 15)

        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
