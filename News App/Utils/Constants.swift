//
//  Constants.swift
//  TIX News
//
//  Created by Indra Cahyadi on 22/02/22.
//

import Foundation

public struct Constants {
    
    struct Urls {
        static func fetchNews() -> URL {
            return URL(string: "https://saurav.tech/NewsAPI/top-headlines/category/technology/us.json")!
        }
    }
    
    struct MusicSource {
        static let song = "music"
        static let musicType = "mp3"
    }
    
    struct Value {
        static let home = "Home"
        static let selectNews = "Select News"
        static let chooseNews = "Choose News"
        static let greeting = "Welcome! you can choose your favorite news while listening to music"
        static let musicPlayState = "Music is playing.. Enjoy!"
        static let musicPauseState = "Oops.. Music stops playing"
    }
    
    struct ErrorState {
        static let errorPlaying = "Can't play song"
    }
    
}

public let playingMusicKey = Notification.Name(rawValue: "playingMusicNotificationKey")
public let pauseMusicKey = Notification.Name(rawValue: "pauseMusicNotificationKey")
