//
//  UserListSectionController.swift
//  GithubUser
//
//  Created by Khemmachat Thongkhum on 11/3/2563 BE.
//  Copyright © 2563 Khemmachat Thongkhum. All rights reserved.
//

import Foundation
import IGListKit

class UserListSectionController: ListSectionController {
     private var model: User!
    
    override init() {
        super.init()
        minimumLineSpacing = 4
        minimumInteritemSpacing = 4
    }

    override func numberOfItems() -> Int {
        return 1
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return UserItemCollectionViewCell.cellHeight(containerSize: collectionContext!.containerSize)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(
            withNibName: "UserItemCollectionViewCell",
            bundle: nil,
            for: self,
            at: index) as? UserItemCollectionViewCell else {
                fatalError()
            }
        
        cell.configure(user: model)
        
        return cell
    }

    override func didUpdate(to object: Any) {
        self.model = object as? User
    }
}
