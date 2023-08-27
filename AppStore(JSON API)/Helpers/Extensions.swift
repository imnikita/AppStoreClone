//
//  Extension float.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 15.03.2021.
//

import UIKit

extension Float{
    func roundToPlaces(places: Int) -> Float{
        let devisor = pow(10.0, Float(places))
        var n = self
        n = (n * devisor).rounded()
        return n / devisor
    }
}

extension UILabel{
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton {
    convenience init(title: String){
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}
