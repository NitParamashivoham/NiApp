//
//  Meditation.swift
//  ni
//
//  Created by Nitesh on 2018-06-10.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit
import AVFoundation
class Meditation: UIViewController {
    
    // Declaring Items
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var EnK: UIImageView!
    @IBOutlet weak var thirdEye: UIImageView!
    @IBOutlet weak var nith: UIImageView!
    @IBOutlet weak var unclutch: UIImageView!
    
    
    
    
    var audioPlayer = AVAudioPlayer()
    
    
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
        progressView.layer.cornerRadius = 8
        
        // MARK - Calling audio
        
        let url = Bundle.main.url(forResource: "thirdEyeM", withExtension: "mp3")!
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url )
            audioPlayer.delegate = self as? AVAudioPlayerDelegate
            audioPlayer.prepareToPlay()
            audioPlayer.currentTime = 0
       
            // For UIProgress Bar - progressView
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
                #selector(updateAudioProgressView), userInfo: nil, repeats: true)
            
            progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
            
            // Background msic for audio 1
            
            let audioSession = AVAudioSession.sharedInstance()
            do
            {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            }
            catch{
                print(error)
            }
            
        }catch{
            print(error)
        }
        
        
      
        
        
        
        
       
        
    }
    
    
   
    //Addin button 1 manipulation
    
    @IBAction func butonPress1(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            button1.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
        }
        else
        {
            audioPlayer.play()
            button1.setImage(#imageLiteral(resourceName: "pause"), for: UIControlState.normal)
        }
    }
    
    
   // Calling func from audio 1 top
    
    
    @objc func updateAudioProgressView()
    {
        if audioPlayer.isPlaying
        {
            // Update progress
            progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
        }
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
       print("here")
    }
    
    
}
