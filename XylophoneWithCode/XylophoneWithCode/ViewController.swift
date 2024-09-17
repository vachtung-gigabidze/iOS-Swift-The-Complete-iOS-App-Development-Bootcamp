//
//  ViewController.swift
//  XylophoneWithCode
//
//  Created by Дмирий Зядик on 17.09.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!

       override func viewDidLoad() {
           super.viewDidLoad()
       }

       @IBAction func keyPressd(_ sender: UIButton) {
           playSound(sound: sender.currentTitle!)
       }
       
       func playSound(sound: String) {
           let url = Bundle.main.url(forResource: sound, withExtension: "wav")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
       }


}

