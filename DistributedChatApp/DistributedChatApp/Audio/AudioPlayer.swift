//
//  AudioPlayer.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import AVFoundation
import Combine
import Logging
import Foundation

fileprivate let log = Logger(label: "CliffApp.AudioPlayer")

class AudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    private var player: AVAudioPlayer? = nil {
        didSet {
            isReady = player != nil
        }
    }
    
    var url: URL? = nil {
        willSet {
            if let url = newValue,
               let data = try? Data.smartContents(of: url),
               let player = try? AVAudioPlayer(data: data) {
                player.delegate = self
                self.player = player
            } else {
                player = nil
            }
        }
    }
    
    @Published var isReady: Bool = false
    @Published var isPlaying: Bool = false {
        willSet {
            if newValue != isPlaying {
                if newValue {
                    play()
                } else {
                    pause()
                }
            }
        }
    }
    
    private func play() {
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            log.warning("Could not activate audio session: \(error)")
        }
        player?.prepareToPlay()
        player?.play()
    }
    
    private func pause() {
        player?.pause()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
    }
}
