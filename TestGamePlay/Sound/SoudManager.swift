//
//  File.swift
//  TestGamePlay
//
//  Created by Роман on 05.12.2023.
//

import Foundation
import AVKit

final class SoundManager {
    
    static let shared = SoundManager()
    
    var soundEffect = true
    var music = false
    
    var player: AVAudioPlayer?
    
    func playSound() {
        if soundEffect {
            guard let url = Bundle.main.url(forResource: "ding", withExtension: ".mp3") else {return}
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            }catch let error {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }else {return}
        if music {
            guard let url = Bundle.main.url(forResource: "christmas", withExtension: ".mp3") else {return}
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            }catch let error {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }else {return}
    }
}
