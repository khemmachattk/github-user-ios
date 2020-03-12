//
//  UserListViewController.swift
//  GithubUser
//
//  Created by Khemmachat Thongkhum on 11/3/2563 BE.
//  Copyright © 2563 Khemmachat Thongkhum. All rights reserved.
//

import IGListKit
import UIKit

class UserListViewController: UIViewController {
    @IBOutlet weak var mainContentView: UIView!
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    let userUseCase = UserUseCase()
    let viewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        loadData()
    }
    
    func loadData() {
        userUseCase.fetchUsers(lastUserId: 0) { [weak self] (users, error) in
            self?.viewModel.users = users ?? []
            self?.adapter.performUpdates(animated: true, completion: nil)
        }
    }
}

// MARK: - Setup View
extension UserListViewController {
    func setupView() {
        setupContainerView()
    }
    
    func setupContainerView() {
        mainContentView.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = mainContentView.bounds
    }
}

// MARK: - List Data Source
extension UserListViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return viewModel.users
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return UserListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
