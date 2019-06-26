//
//  GvHelper.swift
//  gvhelper
//
//  Created by geovision on 2019/6/26.
//

import Foundation

class GvHelper: NSObject {
    
    private let version_major : Int = 0
    private let version_minor : Int = 1
    private let version_patch : Int = 0
    
    private override init(){}
    public static let hp: GvHelper = {
        let instance = GvHelper()
        return instance
    }()
    public var version: String {
        get{
            return "\(version_major).\(version_minor).\(version_patch)"
        }
    }
}
