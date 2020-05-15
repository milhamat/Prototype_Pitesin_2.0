//
//  GameoverViewController.swift
//  Prototype_Pitesin_2.0
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 01/04/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import UIKit
import AVFoundation

class GameoverViewController: UIViewController {
    var gameOver = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        let sound = Bundle.main.path(forResource: "Gameover", ofType: "mp3")
        do{
            gameOver = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            gameOver.play()
        }
        catch{
            print(error)
        }
        
        
            
        
    }
    

    

}
