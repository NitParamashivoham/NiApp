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
     @IBOutlet weak var button2: UIButton!
     @IBOutlet weak var button3: UIButton!
     @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressView1: UIProgressView!
    @IBOutlet weak var progressView2: UIProgressView!
    @IBOutlet weak var progressView3: UIProgressView!
    
    @IBOutlet weak var sessions: UILabel!
    @IBOutlet weak var EnK: UIImageView!
    @IBOutlet weak var thirdEye: UIImageView!
    @IBOutlet weak var nith: UIImageView!
    @IBOutlet weak var unclutch: UIImageView!
    
    
    
    
    var audioPlayer = AVAudioPlayer()
    var audioPlayer1 = AVAudioPlayer()
    var audioPlayer2 = AVAudioPlayer()
    var audioPlayer3 = AVAudioPlayer()

    
    
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
        progressView.clipsToBounds = true
        
        // Set the rounded edge for the inner bar
        progressView.layer.sublayers![1].cornerRadius = 12
        progressView.subviews[1].clipsToBounds = true
        
        progressView1.layer.cornerRadius = 8
        progressView1.clipsToBounds = true
        
        // Set the rounded edge for the inner bar
        progressView1.layer.sublayers![1].cornerRadius = 12
        progressView1.subviews[1].clipsToBounds = true
        progressView2.layer.cornerRadius = 8
        progressView2.clipsToBounds = true
        
        // Set the rounded edge for the inner bar
        progressView2.layer.sublayers![1].cornerRadius = 12
        progressView2.subviews[1].clipsToBounds = true
        progressView3.layer.cornerRadius = 8
        progressView3.clipsToBounds = true
        
        // Set the rounded edge for the inner bar
        progressView3.layer.sublayers![1].cornerRadius = 12
        progressView3.subviews[1].clipsToBounds = true
        
        
        
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
            
            func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
                
                
                var myVariable = 0
                myVariable += 1
                sessions.text = " 0"+String(myVariable)
                
                button1.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
            }
            
            
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
        
        // 2nd audio
        
        let url1 = Bundle.main.url(forResource: "ndy", withExtension: "mp3")!
        do{
            audioPlayer1 = try AVAudioPlayer(contentsOf: url1 )
            audioPlayer1.delegate = self as? AVAudioPlayerDelegate
            audioPlayer1.prepareToPlay()
            audioPlayer1.currentTime = 0
            
            // For UIProgress Bar - progressView
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
                #selector(updateAudioProgressView1), userInfo: nil, repeats: true)
            
            progressView1.setProgress(Float(audioPlayer1.currentTime/audioPlayer1.duration), animated: false)
            
            func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
                
                
                var myVariable = 0
                myVariable += 1
                sessions.text = " 0"+String(myVariable)
                
                button1.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
            }
            
            
            // Background msic for audio 2
            
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
        
        // 3rd audio
        
        let url2 = Bundle.main.url(forResource: "enk", withExtension: "mp3")!
        do{
            audioPlayer2 = try AVAudioPlayer(contentsOf: url2 )
            audioPlayer2.delegate = self as? AVAudioPlayerDelegate
            audioPlayer2.prepareToPlay()
            audioPlayer2.currentTime = 0
            
            // For UIProgress Bar - progressView
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
                #selector(updateAudioProgressView2), userInfo: nil, repeats: true)
            
            progressView2.setProgress(Float(audioPlayer2.currentTime/audioPlayer2.duration), animated: false)
            
            func audioPlayerDidFinishPlaying2(_ player: AVAudioPlayer, successfully flag: Bool) {
                
                
                var myVariable = 0
                myVariable += 1
                sessions.text = " 0"+String(myVariable)
                
                button1.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
            }
            
            
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
        
        //4th adio
        let url3 = Bundle.main.url(forResource: "uncluth", withExtension: "mp3")!
        do{
            audioPlayer3 = try AVAudioPlayer(contentsOf: url3 )
            audioPlayer3.delegate = self as? AVAudioPlayerDelegate
            audioPlayer3.prepareToPlay()
            audioPlayer3.currentTime = 0
            
            // For UIProgress Bar - progressView
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
                #selector(updateAudioProgressView3), userInfo: nil, repeats: true)
            
            progressView3.setProgress(Float(audioPlayer3.currentTime/audioPlayer3.duration), animated: false)
            
            func audioPlayerDidFinishPlaying3(_ player: AVAudioPlayer, successfully flag: Bool) {
                
                
                var myVariable = 0
                myVariable += 1
                sessions.text = " 0"+String(myVariable)
                
                button1.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
            }
            
            
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
    
    
    @IBAction func butonPress2(_ sender: UIButton) {
        if audioPlayer1.isPlaying {
            audioPlayer1.pause()
            button2.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
        }
        else
        {
            audioPlayer1.play()
            button2.setImage(#imageLiteral(resourceName: "pause"), for: UIControlState.normal)
        }
    }
    
    
    @IBAction func butonPress3(_ sender: UIButton) {
        if audioPlayer2.isPlaying {
            audioPlayer2.pause()
            button3.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
        }
        else
        {
            audioPlayer2.play()
            button3.setImage(#imageLiteral(resourceName: "pause"), for: UIControlState.normal)
        }
    }
    
    @IBAction func butonPress4(_ sender: UIButton) {
        if audioPlayer3.isPlaying {
            audioPlayer3.pause()
            button4.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
        }
        else
        {
            audioPlayer3.play()
            button4.setImage(#imageLiteral(resourceName: "pause"), for: UIControlState.normal)
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
    
    @objc func updateAudioProgressView1()
    {
        if audioPlayer1.isPlaying
        {
            // Update progress
            progressView1.setProgress(Float(audioPlayer1.currentTime/audioPlayer1.duration), animated: true)
        }
    }
    @objc func updateAudioProgressView2()
    {
        if audioPlayer2.isPlaying
        {
            // Update progress
            progressView2.setProgress(Float(audioPlayer2.currentTime/audioPlayer2.duration), animated: true)
        }
    }
    @objc func updateAudioProgressView3()
    {
        if audioPlayer3.isPlaying
        {
            // Update progress
            progressView3.setProgress(Float(audioPlayer3.currentTime/audioPlayer3.duration), animated: true)
        }
    }
    
    
    
    
    
  @objc  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
    
        var myVariable = 0
        myVariable += 1
        sessions.text = " 0"+String(myVariable)
        
        button1.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
    }
    
    
}
