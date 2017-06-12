//
//  ViewController.swift
//  ShreeSuktam
//
//  Created by mona patel on 19/04/17.
//  Copyright © 2017 iDroidSolutions. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController
{
    var player = AVAudioPlayer()
    var bell = AVAudioPlayer()
    var shankh = AVAudioPlayer()
    
    
    @IBOutlet var imgview: UIImageView!
    @IBOutlet var bookicon: UIButton!
    
    // button animation
    @IBOutlet var replay: UIButton!
    @IBOutlet var pause: UIButton!
    @IBOutlet var play: UIButton!
    @IBOutlet var more: UIButton!
    
    var isplaying = true
    var btnPlayCenter:CGPoint!
    var btnPauseCenter:CGPoint!
    var btnReplayCenter:CGPoint!
    
    var isbelling = true
    var isringing = true
    
    // Define vaiables for change book image
    var tool:UIImageView!
    var isreading = true
    
    // Define variable for display lyrics as subview
    var readlyrics:UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Code for Background Images
        imgview.animationImages = [UIImage.init(named: "laxmi1.png")! , UIImage.init(named: "laxmi2.png")! , UIImage.init(named: "laxmi3.png")! , UIImage.init(named: "laxmi4.png")! , UIImage.init(named: "laxmi5.png")! , UIImage.init(named: "laxmi6.png")!]
        imgview.animationDuration = 20
        imgview.startAnimating()
        
        // Code for Audio
        do
        {
            let audioPath = Bundle.main.path(forResource: "suktam", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            print(error)
        }
        
        do
        {
            let bellPath = Bundle.main.path(forResource: "bell", ofType: "mp3")
            try bell = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: bellPath!) as URL)
        }
        catch
        {
            print(error)
        }
        
        do
        {
            let shankhPath = Bundle.main.path(forResource: "shankh", ofType: "mp3")
            try shankh = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: shankhPath!) as URL)
        }
        catch
        {
            print(error)
        }
        
        // change book image
        tool = UIImageView()
        btnPlayCenter = play.center
        btnPauseCenter = pause.center
        btnReplayCenter = replay.center
        
        play.center = more.center
        pause.center = more.center
        replay.center = more.center
        
    }
    
    // Button animation
    @IBAction func btnmore(_ sender: UIButton)
    {
        if isplaying
        {
            UIView.animate(withDuration: 0.3, animations:
            {
                    self.play.alpha = 1
                    self.pause.alpha = 1
                    self.replay.alpha = 1
                    self.play.center = self.btnPlayCenter
                    self.pause.center = self.btnPauseCenter
                    self.replay.center = self.btnReplayCenter
            })
            
        }
        else
        {
            UIView.animate(withDuration: 0.3, animations:
            {
                    self.play.alpha = 0
                    self.pause.alpha = 0
                    self.replay.alpha = 0
                    self.play.center = self.more.center
                    self.pause.center = self.more.center
                    self.replay.center = self.more.center
            })
            
        }
        isplaying = !isplaying
    }
    @IBAction func btnPlay(_ sender: UIButton)
    {
        player.play()
        imgview.startAnimating()
    }
    
    @IBAction func btnPause(_ sender: UIButton)
    {
        player.pause()
        imgview.stopAnimating()
    }

    @IBAction func btnReplay(_ sender: UIButton)
    {
        player.currentTime = 0
        player.play()
        imgview.startAnimating()
    }
    
    @IBAction func btnRead(_ sender: UIButton)
    {
        // change book image
        if isreading
        {
            tool.image = #imageLiteral(resourceName: "read")
            bookicon.setImage(#imageLiteral(resourceName: "close"), for: .normal)
            // Open subview of lyrics
            readlyrics = Bundle.main.loadNibNamed("Lyricsview", owner: self, options: nil)?.first as! UIView
            self.view.addSubview(readlyrics)
            readlyrics.frame.origin.y = 390
        }
        else
        {
            tool.image = #imageLiteral(resourceName: "close")
            bookicon.setImage(#imageLiteral(resourceName: "read"), for: .normal)
        }
        isreading = !isreading
        
    }
    
    @IBAction func btnclose(_ sender: UIButton)
    {
        if tool.image == #imageLiteral(resourceName: "close")
        {
             // Close subview of lyrics
             readlyrics.removeFromSuperview()
        }
       
    }
    
    @IBAction func btnBellRing(_ sender: UIButton)
    {
        if isbelling
        {
            bell.play()
        }
        else
        {
            bell.stop()
        }
        isbelling = !isbelling
        
    }
    
    @IBAction func btnShankhaRing(_ sender: UIButton)
    {
        if isringing
        {
            shankh.play()
        }
        else
        {
            shankh.stop()
        }
        isringing = !isringing
        
    }
    // Hide Status Bar from My App
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
 
}

