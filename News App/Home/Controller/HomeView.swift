//
//  HomeView.swift
//  TIX News
//
//  Created by Indra Cahyadi on 22/02/22.
//

import UIKit

extension HomeViewController {
    
    // Setup Programmatically UI
    func setupViews() {
        
        view.backgroundColor = .white
        navigationItem.title = Constants.Value.home
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        musicStateLabel.translatesAutoresizingMaskIntoConstraints = false
        newsButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(contentView)
        contentView.addSubview(welcomeLabel)
        contentView.addSubview(musicStateLabel)
        contentView.addSubview(newsButton)
        contentView.addSubview(footerView)
        
        setupTextLabel()
        setupButtonNewsController()
        setupFooterView()
    }
    
    // Setup Programmatically Content and TextLabel Constraint
    func setupTextLabel() {
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            welcomeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            musicStateLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            musicStateLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            musicStateLabel.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
        ])
        
        welcomeLabel.numberOfLines = 2
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        welcomeLabel.textColor = .systemBlue
        welcomeLabel.text = Constants.Value.greeting
        welcomeLabel.textAlignment = .center
        
        musicStateLabel.font = musicStateLabel.font.withSize(20)
        musicStateLabel.text = Constants.Value.musicPauseState
        musicStateLabel.textAlignment = .center
    }
    
    // Setup programmatically button constraint 
    func setupButtonNewsController() {
        
        NSLayoutConstraint.activate([
            newsButton.topAnchor.constraint(equalTo: musicStateLabel.bottomAnchor, constant: 20),
            newsButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            newsButton.heightAnchor.constraint(equalToConstant: 50),
            newsButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        newsButton.setTitle(Constants.Value.selectNews, for: .normal)
        newsButton.setTitleColor(.white, for: .normal)
        newsButton.backgroundColor = .systemBlue
        newsButton.layer.cornerRadius = 15
        newsButton.layer.borderWidth = 2
        newsButton.layer.borderColor = UIColor.white.cgColor
        newsButton.addTarget(self, action: #selector(goToNews), for: .touchUpInside)
    }
    
    func setupFooterView() {
        
        NSLayoutConstraint.activate([
            footerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 100),
            footerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}

