//
//  HomeCollectionViewCell.swift
//  ni
//
//  Created by Nitesh on 2018-06-26.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgHome: UIImageView!
    @IBOutlet weak var labelHome: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgHome.layer.cornerRadius = 8
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 5.0, height: 21.0)
        self.clipsToBounds = false
}
}
