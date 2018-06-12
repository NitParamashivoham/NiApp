//
//  Meditation.swift
//  ni
//
//  Created by Nitesh on 2018-06-10.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit

class Meditation: UIViewController {
    
    @IBOutlet weak var EnK: UIImageView!
    @IBOutlet weak var thirdEye: UIImageView!
    @IBOutlet weak var nith: UIImageView!
    @IBOutlet weak var unclutch: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Background")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        unclutch.layer.cornerRadius = 8.0
        EnK.layer.cornerRadius = 8.0
        nith.layer.cornerRadius = 8
        thirdEye.layer.cornerRadius = 8
        
      
        
       
        
    }
    
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
