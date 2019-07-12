//
//  GEO.swift
//  gvhelper
//
//  Created by geovision on 2019/7/12.
//

import Foundation

// Constant of Geovision Default value.
public enum GEOdefault {
    static let cmdPort = 10000
    static let webPort = 80
    static let username = "admin"
    static let password = "admin"
    static let demositeIP = "gvipcam.gvdip.com"
    static let demositeAuth = "guest"
}
/// Note: Beyond Basic information about a IPCam Device will Describe here.
public struct GvExtraInfo {
    var isONVIF = false
}
/// Note: Basic information about IPCam Device Connection
public struct GvDeviceInfo {
    var name : String = "" /// Note: as localDisplayName
    var ipAddress : String = ""
    var cmdPort = GEOdefault.cmdPort
    var webPort = GEOdefault.webPort
    var username = GEOdefault.username
    var password = GEOdefault.password
    var camIndex = 0        /// Note: zero-base camera Index
    var extInfo = GvExtraInfo()
    init() {
        
    }
    init(name: String, ip : String, user : String , pass : String, idx : Int){
        self.name = name
        self.ipAddress = ip
        self.username = user
        self.password = pass
        self.camIndex = idx
    }
}

/// Note: Default data for only demo and test.
public struct GEO {
    let demoSite : [GvDeviceInfo] = [GvDeviceInfo(name: "demo1-BX2500", ip: GEOdefault.demositeIP, user: GEOdefault.demositeAuth, pass: GEOdefault.demositeAuth, idx: 0), GvDeviceInfo(name: "demo2-FE520", ip: GEOdefault.demositeIP, user: GEOdefault.demositeAuth, pass: GEOdefault.demositeAuth, idx: 1), GvDeviceInfo(name: "demo3-SD220", ip: GEOdefault.demositeIP, user: GEOdefault.demositeAuth, pass: GEOdefault.demositeAuth, idx: 2)]
    
}

extension UserDefaults {
    enum Keys {
        static let appVersion = "app_version"
        static let db_version = "db_version"
        static let demoMode = "demo_mode"
        static let iconSize = "icon_size"
        static let isHD = "live_view_hd"
        
        static let authToken = "x-auth-token"
        static let account = "RelayBindedAccount"
        static let isBind = "isRelayBindedAccountWithEmail"
        
        static let currentPIndex = "tw.com.geovision.gveye.currentPageIndex"
        static let relayInfo = "tw.com.geovision.gveye.relayInfo"
        static let build = "tw.com.geovision.gveye.build"
        
    }
}
