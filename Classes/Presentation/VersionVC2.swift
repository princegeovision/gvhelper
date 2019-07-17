//
//  VersionVC2.swift
//  gvhelper
//
//  Created by Prince on 2019/6/26.
//

import UIKit

public class VersionVC2 : UIViewController {
	
	static let storyboardName = "VersionVC2"
    @IBOutlet weak var versionView : VersionInfoView!
	//@IBOutlet weak var titleLabel : UILabel!

    override public func viewDidLoad(){
        super.viewDidLoad()
        // setup process
        self.setupVC()
    }

    private func setupVC(){
        self.view.backgroundColor = UIColor.lightGray
        
    }
}
