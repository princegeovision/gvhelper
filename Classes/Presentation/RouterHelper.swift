//
//  RouterHelper.swift
//  gvhelper
//
//  Created by Prince on 2019/7/17.
//

import Foundation

enum HelperVC {
    static let VersionVC2 = "VersionVC2"
    
}
//Useful when bundle.main is our only bundle
enum AppStoryboard : String {
    //SOP01 定義新的 Storyboard. (增加 case)
    //case Main = "Main"
    case VersionVC2 = "VersionVC2"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    //透過UIClass本身取得該Storyboard當中的該 ViewController Class.
    func getVC(vcClass : UIViewController.Type) -> UIViewController {
        return self.instance.instantiateViewController(withIdentifier: vcClass.storyboardID)
    }
}


public class RouterHelper {
    
    private let isLog = true
    //Question: Just keep one ?
    private var currentNC_ : UINavigationController? = nil
    
    /// MARK: Note= Singleton
    //MARK: private Helper functions
    private init(){} ///單例隱藏初始化
    
    public static let shared: RouterHelper = {
        let instance = RouterHelper()
        //instance.current_log = FWLoggerFactory.shared.logger(subsystem: kRMModel.sub.rawValue, category: kRMModel.cate.rawValue)
        return instance
    }()
    
    public func setupNC(_ currentNC: UINavigationController){
        
        //if(self.isLog) {current_log?.log(">>", type: .debug)}
        currentNC_ = currentNC
        //self.currentNC_?.navigationBar.tintColor = .white
        //self.currentNC_?.navigationBar.barTintColor = .dkmRedNormal
        
        //self.setupNaviMenu()
        //if(self.isLog) {current_log?.log("<<", type: .debug)}
    }
    /// Currently No Navigation Bar.
    public func getVCInstance(_ vcid : String)->UIViewController {
        print("getVCInstance: \(vcid)")
        let podBundle = Bundle(for: VersionVC2.self)
        let vc2 = UIStoryboard(name: HelperVC.VersionVC2, bundle: podBundle)
        
        if let targetViewController = vc2.instantiateViewController(withIdentifier: HelperVC.VersionVC2) as? UIViewController {
            
            return targetViewController
        }
    }
//    public func displayVC(_ vcid : String ) -> UIViewController{
//        print("displayVC: \(vcid)")
//        //let version = AppStoryboard.VersionVC2.getVC(vcClass: VersionVC2.self)
//        //return version
//
//        //let accountCheckVC = AppStoryboard.Authentication.getVC(vcClass: AccountCheckVC.self)
//        //self.currentNC_?.pushViewController(accountCheckVC, animated: false)
//
//    }
    
}
