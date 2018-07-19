//
//  ViewController.swift
//  nith

//  Created by Nitesh on 2018-06-08.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var arrayImages = [UIImage]()
    var arrayID = [String]()
    var labelNaam = [String]()
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    let URL_HEROES = "https://growthbooks.cf/active.json"
    
    
    //A string array to save all the names
    var nameArray = [String]()
    
    @IBOutlet weak var labelTest: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        arrayImages = [#imageLiteral(resourceName: "meditation"), #imageLiteral(resourceName: "satsang"), #imageLiteral(resourceName: "c"), #imageLiteral(resourceName: "third-eye")]
        arrayID = ["Meditation", "Live TV", "Programs", "Locations"]
        labelNaam = ["Meditation", "Alive TV", "Programs", "Centers"]
        
        //Parallax
        
        let min = CGFloat(-40)
        let max = CGFloat(40)
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        backgroundImageView.addMotionEffect(motionEffectGroup)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        getJsonFromUrl();
        
        
        // making label tap for quotes
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapFunction))
        
        labelTest.addGestureRecognizer(tap)
    }

    //this function is fetching the json from URL
    func getJsonFromUrl(){
        //creating a NSURL
        let url = NSURL(string: URL_HEROES)
        
        
        
        if Reachability.isConnectedToNetwork(){
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //printing the json in console
                print(jsonObj!.value(forKey: "avengers")!)
                
                //getting the avengers tag array from json and converting it to NSArray
                if let heroeArray = jsonObj!.value(forKey: "avengers") as? NSArray {
                    //looping through all the elements
                    for heroe in heroeArray{
                        
                        //converting the element to a dictionary
                        if let heroeDict = heroe as? NSDictionary {
                            
                            //getting the name from the dictionary
                            if let name = heroeDict.value(forKey: "name") {
                                
                                //adding the name to the array
                                self.nameArray.append((name as? String)!)
                            }
                            
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    //calling another function after fetching the json
                    //it will show the names to label
                    self.showNames()
                })
            }
        }).resume()
    }
    
 else {
    print("Internet connection FAILED")
            
          
            
            labelTest.text = "Integrity to time is fundamental requirement to achieve superconsciousness breakthrough."
    }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        // ViewControllers view ist fully loaded and could present further ViewController
        //Here you could do any other UI operations
        if Reachability.isConnectedToNetwork() == false
       
        {
            let controller = UIAlertController(title: "No Internet Detected", message: "Some feature of app will not work", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            controller.addAction(ok)
            controller.addAction(cancel)
            
            present(controller, animated: true, completion: nil)
        }
        
    }
    
    func showNames(){
        //looing through all the elements of the array
        for name in nameArray{
            
            //appending the names to label
            labelTest.text = labelTest.text! + name + "\n";
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  arrayImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        
        let imageView =  cell.viewWithTag(1) as! UIImageView
        
        imageView.image = arrayImages[indexPath.row]
        cell.labelHome.text! = labelNaam[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:   IndexPath) {
        let name = arrayID[indexPath.row]
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        
        
        
        let activityVC = UIActivityViewController(activityItems: [  self.labelTest.text!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion:  nil)
    
    }


}

