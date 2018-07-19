//
//  MeditateCollectionViewCell.swift
//  ni
//
//  Created by Nitesh on 2018-06-26.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit

class MeditateCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelM: UILabel!
    @IBOutlet weak var imageM: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageM.layer.cornerRadius = 8
        
    }
    override func layoutSublayers(of layer: CALayer) {
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 5.0, height: 21.0)
        self.clipsToBounds = false
    }
    
}
