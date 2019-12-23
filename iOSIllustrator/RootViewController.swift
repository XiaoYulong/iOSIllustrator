//
//  RootViewController.swift
//  iOSIllustrator
//
//  Created by yuxiao on 2019/12/23.
//  Copyright © 2019 Yulong Xiao. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var tableView: UITableView!

    override func loadView() {
        super.loadView()
        tableView = UITableView(frame: .zero, style: .plain)
        view.addSubview(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = TouchesViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "rootControllerCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "rootControllerCell")
        }
        cell!.textLabel?.text = "Touches"
        return cell!
    }
}
