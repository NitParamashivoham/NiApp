//
//  Prog.swift
//  ni
//
//  Created by Nitesh on 2018-06-13.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit
import WebKit
class Prog: UIViewController, UIWebViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
   // For collection view -  down scroll
    var arrayImages = [UIImage]()
    var arrayID = [String]()
    var nameArray = [String]()
    
    @IBOutlet weak var webV: WKWebView!
     @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         arrayImages = [#imageLiteral(resourceName: "meditation"),#imageLiteral(resourceName: "satsang"),#imageLiteral(resourceName: "c"),#imageLiteral(resourceName: "third-eye")]
        arrayID = ["Meditation","Live TV","Home","Locations"]
        nameArray = ["Meditation","Alive TV", "Home","Centers"]
        
      
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProgCollectionViewCell
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = arrayImages[indexPath.row]
        cell.lblPrograms.text! = nameArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = arrayID[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
}

