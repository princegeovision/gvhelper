//
//  GVImageViewExtension.swift
//  gvhelper
//
//  Created by geovision on 2019/6/26.
//

import UIKit

extension UIImageView {
    
    /// 添加邊緣跟顏色的擴展
    public func roundViewWith(borderColor: UIColor, borderWidth: CGFloat) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = self.layer.frame.size.width / 2
        self.clipsToBounds = true
    }
}
