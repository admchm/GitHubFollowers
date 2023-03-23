//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Adam Chomicki on 17/03/2023.
//

import UIKit

class FollowerListVC: UIViewController {

    enum Section {
        case main
    }
    
    var username: String = ""
    var followers: [Follower] = []
    
    
    var collectionView: UICollectionView! // = UICollectionView(frame: .zero)
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
        
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func getFollowers() {
        print("Getting the followers for \(username)")
    
        NetworkManager.shared.getFollower(for: username, page: 1) { [weak self] followers, error in
            // if we want to get rid of the unwrapping here (like self?.followers = followers) then we could use:
            guard let self = self else { return }
            
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Error", message: error?.rawValue ?? "Something went wrong", buttonTitle: "Ok")
                return
            }

            self.followers = followers
            self.updateData()
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as? FollowerCell {
                cell.set(follower: follower)
                return cell
            }
            return FollowerCell()
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)

        dataSource.apply(snapshot, animatingDifferences: true)
    }
}


