//
//  AppDetailCell.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 24.03.2021.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    var app: Result? {
        didSet{
            nameLabel.text = app?.trackName
            priceButton.setTitle(app?.formattedPrice, for: .normal)
            releaseNotesLabel.text = app?.releaseNotes
            appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            
        }
    }
    
    let appIconImageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "This is the app's name", font: .boldSystemFont(ofSize: 26), numberOfLines: 2)
    let priceButton = UIButton(title: "4.99")
    let whatIsNewLabel = UILabel(text: "What is new", font: .boldSystemFont(ofSize: 20))
    let releaseNotesLabel = UILabel(text: "This is release notes label", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        appIconImageView.backgroundColor = .red
        appIconImageView.constrainWidth(constant: 140)
        appIconImageView.constrainHeight(constant: 140)
        
//        backgroundColor = .red
        
        priceButton.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        priceButton.constrainHeight(constant: 32)
        priceButton.constrainWidth(constant: 80)
        priceButton.layer.cornerRadius = 32 / 2
        priceButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        priceButton.setTitleColor(.white, for: .normal)
        nameLabel.textColor = .black
        
        let stackView = VerticalStackView(arangeSubviews: [UIStackView(arrangedSubviews:
                        [appIconImageView, VerticalStackView(arangeSubviews: [nameLabel, UIStackView(arrangedSubviews: [priceButton, UIView()]), UIView()], spacing: 12)], customSpacing: 20),
                        whatIsNewLabel,
                        releaseNotesLabel], spacing: 16)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
