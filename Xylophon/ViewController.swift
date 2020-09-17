//
//  ViewController.swift
//  Xylophon
//
//  Created by Jirel on 16/09/2020.
//  Copyright © 2020 Jirel. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var player: AVAudioPlayer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func keyPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
        
        playSound(sound: sender.currentTitle!)
        
        sender.alpha = 0.8
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
        
    }
    

    func playSound(sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url)

            player = try AVAudioPlayer(contentsOf: url)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    

}

