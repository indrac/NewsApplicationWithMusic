//
//  HomeViewController.swift
//  TIX News
//
//  Created by Indra Cahyadi on 22/02/22.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    internal lazy var contentView = UIView()
    internal lazy var welcomeLabel = UILabel()
    internal lazy var newsButton = UIButton()
    internal lazy var footerView = MusicView()
    internal lazy var musicStateLabel = UILabel()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Setup view in HomeViewController extension
        setupViews()
        
        createObserver()
    }
    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.changeMusicStateLabel(_:)), name: playingMusicKey, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.changeMusicStateLabel(_:)), name: pauseMusicKey, object: nil)
    }
    
    @objc func changeMusicStateLabel(_ notification: NSNotification) {
        let isPlay = notification.name == playingMusicKey
        let textStatus = isPlay ? Constants.Value.musicPlayState : Constants.Value.musicPauseState
        self.musicStateLabel.text = textStatus
    }
    
    @objc func goToNews() {
        let newsVC = NewsViewController()
        self.navigationController?.pushViewController(newsVC, animated: true)
    }

}
