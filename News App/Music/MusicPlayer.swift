//
//  MusicPlayer.swift
//  TIX News
//
//  Created by Indra Cahyadi on 22/02/22.
//

import AVFoundation

public class MusicPlayer {
    
    static let shared = MusicPlayer()
    public var audioPlayer = AVAudioPlayer()
    public var musicStateInformation: String = ""
    public var checkMusicState: Bool = false {
        didSet {
            if checkMusicState {
                self.musicStateInformation = Constants.Value.musicPlayState
            } else {
                self.musicStateInformation = Constants.Value.musicPauseState
            }
        }
    }
    
    init() {
        guard let path = Bundle.main.path(forResource: Constants.MusicSource.song, ofType: Constants.MusicSource.musicType) else {
            return
        }
        
        do {
            let url = URL(fileURLWithPath: path)
            audioPlayer =  try AVAudioPlayer(contentsOf: url)
        } catch {
            print(Constants.ErrorState.errorPlaying)
        }
    }
    
    public func play() {
        audioPlayer.play()
        self.checkMusicState = audioPlayer.isPlaying
        let playNotification = Notification.Name(rawValue: playingMusicKey.rawValue)
        NotificationCenter.default.post(name: playNotification, object: nil)
    }
    
    public func pause() {
        audioPlayer.pause()
        self.checkMusicState = audioPlayer.isPlaying
        let pauseNotification = Notification.Name(rawValue: pauseMusicKey.rawValue)
        NotificationCenter.default.post(name: pauseNotification, object: nil)
    }
    
}
