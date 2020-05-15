//
//  MainViewController.swift
//  Prototype_Pitesin_2.0
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 31/03/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    @IBOutlet weak var square: UIButton!
    @IBOutlet weak var squaredua: UIButton!
    
    var sound = ["cret","crot","crot2","crut","crut2","eegh","eegh2","eegh3","eek","eek2","oing"]
    var player: AVAudioPlayer?
    var mainSong = AVAudioPlayer()
    
    func animateOpacitySatu() {
        UIView.animate(withDuration: 1) {
            // MARK: Set opacity to 0
            self.square.layer.opacity = 0
        }
    }
    func animateOpacityDua() {
        UIView.animate(withDuration: 1) {
            // MARK: Set opacity to 0
            self.squaredua.layer.opacity = 0
        }
    }
    func playSound() {
        sound.shuffle()
        guard let url = Bundle.main.url(forResource: sound[0], withExtension: "mp3") else { return }

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let sound = Bundle.main.path(forResource: "mainthame", ofType: "mp3")
       do{
           mainSong = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
           mainSong.play()
       }
       catch{
           print(error)
       }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func bomBallPressed(_ sender: Any) {
        mainSong.stop()
    }
    
    @IBAction func blueBall_2Pressed(_ sender: Any) {
        playSound()
    }
    
    @IBAction func orangeBall_1Pressed(_ sender: Any) {
        playSound()
    }
    
    @IBAction func orangeBall_2Pressed(_ sender: Any) {
        playSound()
    }
   
    @IBAction func greenBall_1Pressed(_ sender: Any) {
        playSound()
    }
    
    @IBAction func greenBall_2Pressed(_ sender: Any) {
        playSound()
    }
    
    @IBAction func redBall_1Pressed(_ sender: Any) {
        playSound()
    }
    
    @IBAction func redBall_2Pressed(_ sender: Any) {
        playSound()
    }
    
    @IBAction func yellowBall_1Pressed(_ sender: Any) {
        animateOpacityDua()
    }
    
    @IBAction func yellowBall_2Pressed(_ sender: Any) {
        animateOpacitySatu()
    }
    
    
    
}
