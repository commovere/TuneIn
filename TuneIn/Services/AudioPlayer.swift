//
//  AudioPlayer.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 24.12.2022.
//

import AVFoundation
import Foundation

class AudioPlayer {
    static let shared = AudioPlayer()
    private init() {}
    
    private let player = AVPlayer()
    
    var isPlaying: Bool {
        player.rate != 0 && player.error == nil
    }
    
    func play(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        player.pause()
        let asset = AVAsset(url: url)
        guard asset.isPlayable else { return }
        let item = AVPlayerItem(asset: asset)
        player.replaceCurrentItem(with: item)
        player.play()
    }
    
    func pauseOrResume() {
        guard player.currentItem != nil else { return }
        isPlaying ? player.pause() : player.play()
    }
}
