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

    @IBOutlet weak var testImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(GvHelper.hp.version)")

        self.testImageView.roundViewWith(borderColor: .white, borderWidth: 5.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

