//
//  ViewController.swift
//  gvhelper
//
//  Created by princegeovision on 06/26/2019.
//  Copyright (c) 2019 princegeovision. All rights reserved.
//

import UIKit
import gvhelper

class ViewController: UIViewController {

    @IBOutlet weak var openButton : UIButton!
    
    @IBOutlet weak var testImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(GvHelper.hp.version)")

        self.testImageView.roundViewWith(borderColor: .white, borderWidth: 5.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    @IBAction func openButton_Click(_ sender: Any) {
        
        let podBundle = Bundle(for: VersionVC2.self)
        
        
        let vVCStoryboard = UIStoryboard(name: "VersionVC2", bundle: podBundle)
        if let targetViewController = vVCStoryboard.instantiateViewController(withIdentifier: "VersionVC2") as? UIViewController {


            self.present(targetViewController, animated: true) {
                print("Show-Done")
            }
        }
        
        
    }
    
}

