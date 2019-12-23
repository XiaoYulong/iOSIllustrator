//
//  TouchesViewController.swift
//  iOSIllustrator
//
//  Created by yuxiao on 2019/12/23.
//  Copyright © 2019 Yulong Xiao. All rights reserved.
//

import UIKit

class TouchesViewController: UIViewController {

    var touchesView: TouchesView!
    
    override func loadView() {
        super.loadView()
        touchesView = TouchesView()
        touchesView.translatesAutoresizingMaskIntoConstraints = false
        view = TouchesView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
