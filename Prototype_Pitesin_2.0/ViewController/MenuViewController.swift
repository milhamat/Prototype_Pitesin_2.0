//
//  ViewController.swift
//  Prototype_Pitesin_2.0
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 31/03/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import UIKit
import AVFoundation

class MenuViewController: UIViewController {
    
    
    //var joySound = ["phiyaaa","pphoray","pwiewie","pyahoo"]
    var mainSong = AVAudioPlayer()
    var player: AVAudioPlayer?
    
    
    
    
    
    func background(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        backgroundImage.image = UIImage(named: "MainBackground")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }

    func playSound() {
        //joySound.shuffle()
        guard let url = Bundle.main.url(forResource: "pyahoo", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background()
        let sound = Bundle.main.path(forResource: "mainthame", ofType: "mp3")
        do{
            mainSong = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            mainSong.play()
        }
        catch{
            print(error)
        }
        
        //while true{
            
        //}
        
    }

    @IBAction func pressButton(_ sender: Any) {
        playSound()
        mainSong.stop()
    }
    
}
