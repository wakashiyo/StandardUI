//
//  CollectionViewCell.swift
//  CardUI
//
//  Created by 吉川昂広 on 2019/03/22.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(str: String) {
        imageView.image = UIImage(named: str)
        
        // UICollectionViewのcontentViewプロパティには罫線と角丸に関する設定を行う
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 10.0
        
        // UICollectionViewのおおもとの部分にはドロップシャドウに関する設定を行う
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowRadius = 10.0
        self.layer.shadowOpacity = 0.5
    }

}
