//
//  UIVC+Extension.swift
//  gvhelper
//
//  Created by geovision on 2019/7/17.
//

import Foundation

extension UIViewController {
    // 開關 NavigationBar
    func showNavigationBar(_ flag:Bool){
        
        if( flag == true){
            self.navigationController?.navigationBar.isHidden = false;
        } else {
            self.navigationController?.navigationBar.isHidden = true;
        }
    }
    /// Make sure call This function Before View Appear.
    /// Navigation bar Tint Color and Title
    public func setNavigationColorB4ViewAppear(bg: UIColor, txt: UIColor){
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = bg
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : txt]
    }
    
    // 隱藏鍵盤
    func hideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    //for Storyboard Help related code.
    class var storyboardID : String {
        return "\(self)"
    }
    
    //Back 按鈕替換
    func initBackButton(show isDisplay:Bool){
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "left_arrow36"), for: .normal)
        button.setTitle("", for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        if(isDisplay == true){
            button.isHidden = false
        } else {
            button.isHidden = true
        }
    }
    @objc func backAction(sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
