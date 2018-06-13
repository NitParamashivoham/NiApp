//
//  Prog.swift
//  ni
//
//  Created by Nitesh on 2018-06-13.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit
import WebKit
class Prog: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webV: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Background")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        let url = URL(string: "http://programs.nithyananda.org/")!
        let request = URLRequest(url: url)
        
        webV.load(request)
    }
    
    // MARK: To load forms and links
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        switch navigationType {
        case .linkClicked:
            // Open links in Safari
            guard let url = request.url else
            {
                return true
                
            }
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                // openURL(_:) is deprecated in iOS 10+.
                UIApplication.shared.openURL(url)
            }
            return false
        default:
            // Handle other navigation types...
            return true
        }
    }
    
   
    
    
}

