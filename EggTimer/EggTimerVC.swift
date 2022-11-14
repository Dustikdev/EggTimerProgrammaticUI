//
//  EggTimerVC.swift
//  EggTimer
//
//  Created by Никита Швец on 14.11.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit
import AVFAudio

class EggTimerVC: UIViewController {

    let eggStatusLabel = UILabel()
    let softButton = UIButton()
    let mediumButton = UIButton()
    let hardButton = UIButton()
    let progressLine = UIProgressView()
    let softImageView = UIImageView()
    let mediumImageView = UIImageView()
    let hardImageView = UIImageView()
    
    var player: AVAudioPlayer?
    let eggTimes: [String:Int] = ["Soft":3, "Medium":7, "Hard":12] //сделано для тестирования, вообще надо умножить на 60
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureEggTimerVCInterface()
    }
    
    func startTimer(button: String) {
        timer.invalidate()
        secondPassed = 0
        progressLine.progress = 0.0
        eggStatusLabel.text = button
        guard let totalTime = eggTimes[button] else { return }
        self.totalTime = totalTime
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer(){
        if secondPassed < Double(totalTime) {
            secondPassed += 0.01
            progressLine.progress = Float(secondPassed) / Float(totalTime)
        } else {
            playSound()
            timer.invalidate()
            eggStatusLabel.text = "Your eggs ready"
            progressLine.progress = 1.0
        }
    }

    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
