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


}

extension UITableView {
    public func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: type.self), for: indexPath) as! T
    }
}
