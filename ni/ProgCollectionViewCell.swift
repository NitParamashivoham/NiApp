//
//  ProgCollectionViewCell.swift
//  ni
//
//  Created by Nitesh on 2018-06-26.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit

class ProgCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var lblPrograms: UILabel!
    @IBOutlet weak var imgPrograms: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    imgPrograms.layer.cornerRadius = 8
    
}
override func layoutSubviews() {
    super.layoutSubviews()
    layer.shadowRadius = 4
    layer.shadowOpacity = 0.8
    layer.shadowOffset = CGSize(width: 4.0, height: 21.0)
    self.clipsToBounds = false
    
}
    
}
