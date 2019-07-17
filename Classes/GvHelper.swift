//
//  GvHelper.swift
//  gvhelper
//
//  Created by geovision on 2019/6/26.
//

import Foundation
import os.log

public class GvHelper: NSObject {
    
    private let version_major : Int = 0
    private let version_minor : Int = 2
    private let version_patch : Int = 3
    
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

public protocol Logger: class {
    var subsystem: String {get}
    var category: String {get}
    
    init(subsystem: String, category: String)
    //定義介面
    func log(_ message: String, type: OSLogType, file: String, function: String, line: Int)
}
// We provide default argument values via a protocol extension
extension Logger {
    //實作 Default function.
    public func log(_ message: String, type: OSLogType, file: String = #file, function: String = #function, line: Int = #line) {
        //其實這邊拿到的file 是 file_path
        let theFileName = (file as NSString).lastPathComponent
        return log(message, type: type, file: theFileName, function: function, line: line)
    }
}
// Log levels
extension OSLogType: CustomStringConvertible {
    public var description: String {
        switch self {
        case OSLogType.info:
            return "INFO"
        case OSLogType.debug:
            return "DEBUG"
        case OSLogType.error:
            return "ERROR"
        case OSLogType.fault:
            return "FAULT"
        default:
            return "DEFAULT"
        }
    }
}

// Logger relies on the Unified System Logger introduced with iOS10
public class HelperLogger: Logger {
    public let subsystem: String
    public let category: String
    fileprivate let logger: OSLog
    fileprivate let syncQueue = DispatchQueue(label: "tw.com.geovision.GvHelper.logger")
    
    public required init(subsystem: String, category: String = "") {
        self.subsystem = subsystem
        self.category = category
        self.logger = OSLog(subsystem: subsystem, category: category)
    }
    public func log(_ message: String, type: OSLogType, file: String = #file, function: String = #function, line: Int = #line) {
        syncQueue.sync {
            os_log("%@ [%@ %@ line%d] %@", log: logger, type: type, type.description, file, function, line, message)
        }
    }
}
// The FlyweightLoggerFactory ensures the Flyweight behavior: the same logger instance
// is returned for a particular identifier (subsystem + category pair)
// The Flyweight pattern separates the intrinsic, shared state - the logger ID - from the extrinsic set of attributes, that is, the log message and the log level
public class HelperLoggerFactory {
    
    fileprivate var loggersByID = Dictionary<String, HelperLogger>()
    fileprivate let syncQueue = DispatchQueue(label: "tw.com.geovision.GvHelper.HelperLoggerFactory")
    
    public static var shared = HelperLoggerFactory()
    fileprivate init() {}
    
    public func logger(subsystem: String, category: String = "") -> HelperLogger? {
        var result: HelperLogger?
        syncQueue.sync {
            let key = subsystem + category
            if let logger = loggersByID[key] {
                result = logger
            } else {
                result = HelperLogger(subsystem: subsystem, category: category)
                loggersByID[key] = result
            }
        }
        return result
    }
}


