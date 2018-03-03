//
//  ViewController.swift
//  Tracker
//
//  Created by Alexander Khitev on 3/3/18.
//  Copyright © 2018 Alexander Khitev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.shared.start()
    }

}

