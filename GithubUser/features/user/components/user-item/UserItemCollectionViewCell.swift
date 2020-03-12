//
//  UserItemCollectionViewCell.swift
//  GithubUser
//
//  Created by Khemmachat Thongkhum on 11/3/2563 BE.
//  Copyright © 2563 Khemmachat Thongkhum. All rights reserved.
//

import UIKit

class UserItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var adminSiteLabel: UILabel!
    
    private static let containerInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    private static let font = UIFont.systemFont(ofSize: 17)
    private static let mainStackSpacing = CGFloat(10)
    private static let labelSatckSpacing = CGFloat(5)
    private static let thumbnailSize = CGSize(width: 50, height: 50)
    private static let switchSize = CGSize(width: 50, height: 50)
    
    func configure(user: User) {
        loginLabel.text = user.login
        urlLabel.text = user.url
        accountTypeLabel.text = user.type
        adminSiteLabel.text = user.adminText
        thumbnailImageView.kf.setImage(with: URL(string: user.avatarUrl))
    }
    
    static func cellHeight(containerSize: CGSize, user: User) -> CGSize {
        let labelWidth = containerSize.width
            - containerInsets.left
            - containerInsets.right
            - thumbnailSize.width
            - switchSize.width
            - (mainStackSpacing * 2)
        
        let loginHeight = textHeight(text: user.login, width: labelWidth, font: font)
        let urlHeight = textHeight(text: user.url, width: labelWidth, font: font)
        let accountTypeHeight = textHeight(text: user.type, width: labelWidth, font: font)
        let adminHeight = textHeight(text: user.adminText, width: labelWidth, font: font)
        
        return CGSize(width: containerSize.width,
                      height: containerInsets.top
                        + containerInsets.bottom
                        + (labelSatckSpacing * 3)
                        + loginHeight
                        + urlHeight
                        + accountTypeHeight
                        + adminHeight)
    }
    
    static func textHeight(text: String, width: CGFloat, font: UIFont) -> CGFloat {
        let constrainedSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let attributes = [ NSAttributedString.Key.font: font ]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        let bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
        return ceil(bounds.height)
    }
}
