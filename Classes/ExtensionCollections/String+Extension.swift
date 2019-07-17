//
//  StringExtension.swift
//  Extentsion
//
//  Created by Prince Wang on 1/22/15.
//  Copyright (c) 2015 Prince Wang. All rights reserved.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func substring(_ from: Int) -> String {
        //Update For Swift 4
        return String(self[self.index(self.startIndex, offsetBy: from)...])
    }
    
    var length: Int {
        return self.count
    }
    var floatValue: Float {
        return (self as NSString).floatValue
    }

}
