//
//  FavoritesListVC.swift
//  GitHubFollowers
//
//  Created by Adam Chomicki on 15/03/2023.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = false
    }
}
