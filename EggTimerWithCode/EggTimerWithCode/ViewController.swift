//
//  ViewController.swift
//  EggTimerWithCode
//
//  Created by Дмирий Зядик on 17.09.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

// MARK: - UI
    private lazy var mainStackView: UIStackView = {
        let element =  UIStackView()
        
        element.spacing = 0
        element.distribution = .fillEqually
        element.axis = .vertical
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var titleLable: UILabel = {
        let element = UILabel()
        element.text = "How do you like your eggs?"
        element.font = .systemFont(ofSize: 25)
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var eggsStackView: UIStackView = {
        let element = UIStackView()
        
        element.spacing = 20
        element.distribution = .fillEqually
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let softImageView = UIImageView(image: #imageLiteral(resourceName: "soft_egg") )
    private let softButton = UIButton(text: "Soft")
    
    private let hardImageView = UIImageView(image: #imageLiteral(resourceName: "hard_egg") )
    private let hardButton = UIButton(text: "Hart")
    
    private let mediumImageView = UIImageView(image: #imageLiteral(resourceName: "medium_egg") )
    private let meduimButton = UIButton(text: "Medium")
    
    private lazy var timerView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var progressView: UIProgressView = {
        let element = UIProgressView()
        element.progressTintColor = .systemYellow
        element.trackTintColor = .systemGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Private Properties
    
    private let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    private var totalTime = 0
    private var secondPassed = 0
    private var timer = Timer()
    private var player: AVAudioPlayer?
    private var nameSoundTimer = "alarm_sound"
    
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValue()
        setupContraints()
    }
    
// MARK: - Bisiness logic
    private func playSound(_ soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }
        
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    
    @objc private func eggsButtonsTapped(_ sender: UIButton){
        timer.invalidate()
        progressView.setProgress(0, animated: true)
        secondPassed = 0
        
        let hardness = sender.titleLabel?.text ?? "error"
        
        titleLable.text = "You should \(hardness)"
        
        totalTime = eggTimes[hardness] ?? 0
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer(){
        if secondPassed < totalTime {
            secondPassed += 1
            let percentageProgress = Float(secondPassed) / Float(totalTime)
            progressView.setProgress(percentageProgress, animated: true)} else {
                playSound(nameSoundTimer)
                timer.invalidate()
                secondPassed = 0
                titleLable.text = "That's done! Let's go repets?"
                progressView.setProgress(1, animated: true)
            }
        }
    
}

// MARK: - Set view and Set constrains

extension ViewController {
    private func setValue() {
        view.backgroundColor = .systemCyan
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLable)
        mainStackView.addArrangedSubview(eggsStackView)
        mainStackView.addArrangedSubview(timerView)
        
        eggsStackView.addArrangedSubview(softImageView)
        eggsStackView.addArrangedSubview(mediumImageView)
        eggsStackView.addArrangedSubview(hardImageView)
        
        softImageView.addSubview(softButton)
        mediumImageView.addSubview(meduimButton)
        hardImageView.addSubview(hardButton)
        
        softButton.addTarget(self, action: #selector(eggsButtonsTapped), for:   .touchUpInside)
        meduimButton.addTarget(self, action: #selector(eggsButtonsTapped), for:   .touchUpInside)
        hardButton.addTarget(self, action: #selector(eggsButtonsTapped), for:   .touchUpInside)
        
        timerView.addSubview(progressView)
        
    }

    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            progressView.centerYAnchor.constraint(equalTo: timerView.centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: timerView.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: timerView.trailingAnchor),
            
            softButton.topAnchor.constraint(equalTo: softImageView.topAnchor),
            softButton.bottomAnchor.constraint(equalTo: softImageView.bottomAnchor),
            softButton.leadingAnchor.constraint(equalTo: softImageView.leadingAnchor),
            softButton.trailingAnchor.constraint(equalTo: softImageView.trailingAnchor),
            
            meduimButton.topAnchor.constraint(equalTo: mediumImageView.topAnchor),
            meduimButton.bottomAnchor.constraint(equalTo: mediumImageView.bottomAnchor),
            meduimButton.leadingAnchor.constraint(equalTo: mediumImageView.leadingAnchor),
            meduimButton.trailingAnchor.constraint(equalTo: mediumImageView.trailingAnchor),
            
            hardButton.topAnchor.constraint(equalTo: hardImageView.topAnchor),
            hardButton.bottomAnchor.constraint(equalTo: hardImageView.bottomAnchor),
            hardButton.leadingAnchor.constraint(equalTo: hardImageView.leadingAnchor),
            hardButton.trailingAnchor.constraint(equalTo: hardImageView.trailingAnchor),
        ])
    }
}

extension UIButton {
    convenience init(text: String){
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 18, weight: .black)
        self.tintColor = .white        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIImageView {
    convenience init(image: UIImage)
    {
        self.init()
        self.image = image
        self.contentMode = .scaleAspectFit
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
