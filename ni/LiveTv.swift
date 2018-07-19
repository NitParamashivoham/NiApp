//
//  LiveTv.swift
//  ni
//
//  Created by Nitesh on 2018-06-11.
//  Copyright © 2018 Nitesh. All rights reserved.
//


import UIKit
import WebKit

class LiveTv: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var arrayImages = [UIImage]()
    var arrayID = [String]()
    var nameArray = [String]()
    
    
    
    
    
    @IBOutlet weak var webView: WKWebView!
     @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        arrayImages = [#imageLiteral(resourceName: "meditation"), #imageLiteral(resourceName: "satsang"), #imageLiteral(resourceName: "c"), #imageLiteral(resourceName: "third-eye")]
        arrayID = ["Meditation", "Home", "Programs", "Locations"]
        nameArray = ["Meditation", "Home", "Programs", "Centers"]
        
           
        let url = URL(string: "http://nithyananda.tv/tv/")
        let request = URLRequest(url: url!)
        
        webView.load(request)
    }
    
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return  arrayImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TvCollectionViewCell
        
        let imageView =  cell.viewWithTag(1) as! UIImageView
        
        imageView.image = arrayImages[indexPath.row]
        cell.lblTv.text! = nameArray[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:   IndexPath) {
    let name = arrayID[indexPath.row]
    
    let viewController = storyboard?.instantiateViewController(withIdentifier: name)
    self.navigationController?.pushViewController(viewController!, animated: true)
    
    }
    
    
}
