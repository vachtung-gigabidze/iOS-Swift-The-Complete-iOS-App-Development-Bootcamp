//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func changeButtonAlpha(_ button: UIButton)
    {
        button.alpha = button.alpha == 1 ? 0.5 : 1
    }

    @IBAction func keyPressd(_ sender: UIButton) {
        changeButtonAlpha(sender)
        print( "Start")
//        sender.alpha = 0.5
        guard sender.currentTitle != nil else { return }
        playSound(sound: sender.currentTitle!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
           print("End")
//            sender.alpha = 1
            self.changeButtonAlpha(sender)
        }
        
        
        
    }
    
    func playSound(sound: String) {
        let url = Bundle.main.url(forResource: sound, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

        
    }
}

