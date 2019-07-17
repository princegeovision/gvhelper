//
//  UIView.swift
//  Extension
//
//  Created by Prince Wang on 11/5/15.
//  Copyright © 2015 Prince Wang. All rights reserved.
//

import UIKit

public enum ViewOrientation {
    case Portrait
    case Landscape
}

extension UIView {
    public class func viewOrientationForSize(size:CGSize) -> ViewOrientation {
        return (size.width > size.height) ? .Landscape : .Portrait
    }
    
    public var viewOrientation:ViewOrientation {
        return UIView.viewOrientationForSize(size: self.bounds.size)
    }
    
    public func isViewOrientationPortrait() -> Bool {
        return self.viewOrientation == .Portrait
    }
    
    public func isViewOrientationLandscape() -> Bool {
        return self.viewOrientation == .Landscape
    }
}

extension UIView {
    class func loadNib<T: UIView>(_ viewType: T.Type) -> T {
        let className = String.className(viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: nil, options: nil)!.first as! T
    }
    
    class func loadNib() -> Self {
        return loadNib(self)
    }
    
    
    // 可以取得 Parent ViewController
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if parentResponder is UIViewController {
                return parentResponder as? UIViewController //as! UIViewController!
            }
        }
        return nil
    }
    
    
    func setBorder(color: UIColor) {
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
    }
}
