//
//  ViewController.swift
//  XylophoneWithCode
//
//  Created by Дмирий Зядик on 17.09.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    private let namedButtons = ["A", "C", "B", "F", "G", "E", "D"]
    private var buttonStack = UIStackView()
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        setView()
        setConstraints()
        createButtons()
    }
}

extension ViewController {
    
    private func toggleButtonAlpha(_ button: UIButton) {
        button.alpha = button.alpha == 1 ? 0.5 : 1
    }
    
    @objc private func keyPressed(_ sender: UIButton) {
        toggleButtonAlpha(sender)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.toggleButtonAlpha(sender)
        }
        guard let buttonText = sender.currentTitle else { return }
       playSound(sound: sender.currentTitle!)
    }

    private func playSound(sound: String) {
       let url = Bundle.main.url(forResource: sound, withExtension: "wav")
       player = try! AVAudioPlayer(contentsOf: url!)
       player.play()
    }
    
    private func getColor(for name: String) -> UIColor {
        return switch name {
        case "A": .systemRed
        case "C": .systemOrange
        case "B" : .systemYellow
        case "F": .systemGreen
        case "G": .systemIndigo
        case "E" : .systemBlue
        case "D" : .systemPurple
        default: .white
        }
    }
    
    private func setView(){
        view.backgroundColor = .white
        view.addSubview(buttonStack)
        buttonStack.alignment = .center
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.backgroundColor = .green
        buttonStack.axis = .vertical
        buttonStack.spacing = 10
        buttonStack.distribution = .fillEqually
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
    }
    
    private func createButtons(){
        for (index, nameButton) in namedButtons.enumerated() {
            let multipliedWidth = 0.97 - (0.03 * Double(index))
            createButton(name: nameButton, width: multipliedWidth, background: getColor(for: nameButton))
        }
        //namedButton.forEach( (index, nameButton: String) in createButton(namedButton))
    }
    
    private func createButton(name:String, width: Double, background:UIColor) {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(name, for: .normal)
        button.backgroundColor = background
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 45)
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        buttonStack.addArrangedSubview(button)
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: width).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }

}
