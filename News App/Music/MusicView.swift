//
//  MusicView.swift
//  TIX News
//
//  Created by Indra Cahyadi on 22/02/22.
//

import UIKit

public class MusicView: UIView {
    
    public lazy var playButton = UIButton(type: .custom)
    public lazy var pauseButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBlue
        
        translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(playButton)
        addSubview(pauseButton)
        
        playButton.setImage(UIImage(named: "play-button"), for: .normal)
        pauseButton.setImage(UIImage(named: "pause-button"), for: .normal)
        
        playButton.addTarget(self, action: #selector(playMusic), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pauseMusic), for: .touchUpInside)
        
        setupButtonConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButtonConstraint() {
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -25),
            playButton.heightAnchor.constraint(equalToConstant: 40),
            playButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            pauseButton.topAnchor.constraint(equalTo: self.playButton.topAnchor),
            pauseButton.leadingAnchor.constraint(equalTo: self.playButton.trailingAnchor, constant: 10),
            pauseButton.heightAnchor.constraint(equalToConstant: 40),
            pauseButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func playMusic() {
        MusicPlayer.shared.play()
    }
    
    @objc func pauseMusic() {
        MusicPlayer.shared.pause()
    }
    
}
