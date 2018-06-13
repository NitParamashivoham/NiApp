//
//  LiveTv.swift
//  ni
//
//  Created by Nitesh on 2018-06-11.
//  Copyright © 2018 Nitesh. All rights reserved.
//


import UIKit
import WebKit

class LiveTv: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Background")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        
        let url = URL(string: "http://nithyananda.tv/tv/")
        let request = URLRequest(url: url!)
        
        webView.load(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
