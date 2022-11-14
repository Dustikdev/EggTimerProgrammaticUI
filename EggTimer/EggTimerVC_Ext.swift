//
//  EggTimerVC_Ext.swift
//  EggTimer
//
//  Created by Никита Швец on 14.11.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

extension EggTimerVC {
    
    func configureEggTimerVCInterface() {
        configureStatusEggLabel()
        configureMediumImageView()
        configureSoftImageView()
        configureHardImageView()
        configureSoftButton()
        configureMediumButton()
        configureHardButton()
        configureProgressLine()
    }
    
    func configureStatusEggLabel() {
        view.addSubview(eggStatusLabel)
        eggStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        eggStatusLabel.text = "How do you like your eggs?"
        eggStatusLabel.font = .systemFont(ofSize: 30, weight: .medium)
        NSLayoutConstraint.activate([
            eggStatusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            eggStatusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
    }
    
    func configureMediumImageView() {
        view.addSubview(mediumImageView)
        mediumImageView.translatesAutoresizingMaskIntoConstraints = false
        mediumImageView.image = UIImage(named: "medium_egg")
        NSLayoutConstraint.activate([
            mediumImageView.widthAnchor.constraint(equalToConstant: 120),
            mediumImageView.heightAnchor.constraint(equalToConstant: 160),
            mediumImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            mediumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureSoftImageView() {
        view.addSubview(softImageView)
        softImageView.translatesAutoresizingMaskIntoConstraints = false
        softImageView.image = UIImage(named: "soft_egg")
        NSLayoutConstraint.activate([
            softImageView.widthAnchor.constraint(equalToConstant: 120),
            softImageView.heightAnchor.constraint(equalToConstant: 160),
            softImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            softImageView.trailingAnchor.constraint(equalTo: mediumImageView.leadingAnchor, constant: -15)
        ])
    }
    
    func configureHardImageView() {
        view.addSubview(hardImageView)
        hardImageView.translatesAutoresizingMaskIntoConstraints = false
        hardImageView.image = UIImage(named: "hard_egg")
        NSLayoutConstraint.activate([
            hardImageView.widthAnchor.constraint(equalToConstant: 120),
            hardImageView.heightAnchor.constraint(equalToConstant: 160),
            hardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            hardImageView.leadingAnchor.constraint(equalTo: mediumImageView.trailingAnchor, constant: 15),
        ])
    }
    
    func configureSoftButton() {
        view.addSubview(softButton)
        softButton.addTarget(self, action: #selector(softButtonTapped), for: .touchUpInside)
        softButton.translatesAutoresizingMaskIntoConstraints = false
        softButton.setTitle("Soft", for: .normal)
        softButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
        NSLayoutConstraint.activate([
            softButton.widthAnchor.constraint(equalToConstant: 120),
            softButton.heightAnchor.constraint(equalToConstant: 160),
            softButton.centerYAnchor.constraint(equalTo: softImageView.centerYAnchor),
            softButton.centerXAnchor.constraint(equalTo: softImageView.centerXAnchor)
        ])
    }
    
    @objc func softButtonTapped() {
        guard let button = softButton.titleLabel?.text else { return }
        startTimer(button: button)
    }
    
    func configureMediumButton() {
        view.addSubview(mediumButton)
        mediumButton.addTarget(self, action: #selector(mediumButtonTapped), for: .touchUpInside)
        mediumButton.translatesAutoresizingMaskIntoConstraints = false
        mediumButton.setTitle("Medium", for: .normal)
        mediumButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
        NSLayoutConstraint.activate([
            mediumButton.widthAnchor.constraint(equalToConstant: 120),
            mediumButton.heightAnchor.constraint(equalToConstant: 160),
            mediumButton.centerYAnchor.constraint(equalTo: mediumImageView.centerYAnchor),
            mediumButton.centerXAnchor.constraint(equalTo: mediumImageView.centerXAnchor)
        ])
    }
    
    @objc func mediumButtonTapped() {
        guard let button = mediumButton.titleLabel?.text else { return }
        startTimer(button: button)
    }
    
    func configureHardButton() {
        view.addSubview(hardButton)
        hardButton.addTarget(self, action: #selector(hardButtonTapped), for: .touchUpInside)
        hardButton.translatesAutoresizingMaskIntoConstraints = false
        hardButton.setTitle("Hard", for: .normal)
        hardButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
        NSLayoutConstraint.activate([
            hardButton.widthAnchor.constraint(equalToConstant: 120),
            hardButton.heightAnchor.constraint(equalToConstant: 160),
            hardButton.centerYAnchor.constraint(equalTo: hardImageView.centerYAnchor),
            hardButton.centerXAnchor.constraint(equalTo: hardImageView.centerXAnchor)
        ])
    }
    
    @objc func hardButtonTapped() {
        guard let button = hardButton.titleLabel?.text else { return }
        startTimer(button: button)
    }
    
    func configureProgressLine() {
        view.addSubview(progressLine)
        progressLine.translatesAutoresizingMaskIntoConstraints = false
        progressLine.progress = 0
        progressLine.progressViewStyle = .bar
        progressLine.progressTintColor = .systemYellow
        progressLine.trackTintColor = .systemGray
        NSLayoutConstraint.activate([
            progressLine.heightAnchor.constraint(equalToConstant: 10),
            progressLine.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            progressLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            progressLine.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30)
        ])
    }
    
    
    
}
