//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Adam Chomicki on 17/03/2023.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
