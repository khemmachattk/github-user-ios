//
//  UserItemCollectionViewCell.swift
//  GithubUser
//
//  Created by Khemmachat Thongkhum on 11/3/2563 BE.
//  Copyright © 2563 Khemmachat Thongkhum. All rights reserved.
//

import UIKit

class UserItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var loginLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(user: User) {
        self.loginLabel.text = user.login
    }
    
    static func cellHeight(containerSize: CGSize) -> CGSize {
        return CGSize(width: containerSize.width, height: 60)
    }
}
