//
//  UIViewsExtensions.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 01/10/2021.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable
    var viewCornerRadius: CGFloat{
        set{self.layer.cornerRadius = newValue;self.clipsToBounds = true}
        get{return self.viewCornerRadius}
    }

    func showShadow(){
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
}

extension UITableView {
    public func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: type.self), for: indexPath) as! T
    }
}
