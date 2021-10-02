//
//  UIViewsExtensions.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 01/10/2021.
//

import Foundation
import UIKit

//MARK:- UIView
extension UIView {
    //MARK: Corner Radius
    @IBInspectable
    var viewCornerRadius: CGFloat{
        set{self.layer.cornerRadius = newValue;self.clipsToBounds = true}
        get{return self.viewCornerRadius}
    }
    //MARK: Shadow
    func showShadow(){
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
    
    //MARK: Border
    @IBInspectable
    var borderColor: UIColor{
        set{self.layer.borderColor = newValue.cgColor}
        get{return self.borderColor}
    }
    @IBInspectable
    var borderWidth: CGFloat{
        set{self.layer.borderWidth = newValue}
        get{return self.layer.borderWidth}
    }
}

//MARK:- UITableView
extension UITableView {
    //MARK: Dequeue Reusable Cell
    public func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: type.self), for: indexPath) as! T
    }
}

//MARK:- UIViewController
extension UIViewController{
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate() -> Self {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
        return vc
    }
}

