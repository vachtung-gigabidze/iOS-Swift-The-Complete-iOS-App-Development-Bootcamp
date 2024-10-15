//
//  ViewController.swift
//  QuizzlerWithCode
//
//  Created by Дмирий Зядик on 15.10.2024.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    // MARK: - UI
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Background-Bubbles")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var mainStackView = UIStackView()
    private var buttonsStackView = UIStackView()
    
    private var questionLabel = UILabel(text: "Question", textAlignment: .left)
    private var scoreLabel = UILabel(text: "Score", textAlignment: .left)
    
    private lazy var progressBar : UIProgressView = {
        let element = UIProgressView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var choose1Button = UIButton(text:"")
    private var choose2Button = UIButton(text:"")
    private var choose3Button = UIButton(text:"")
    
    
    // MARK: - Variables
    
    var quizBrain = QuizBrain()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setupConstrains()
        updateUI()
        
        choose1Button.addTarget(self, action: #selector(answerButtonPress), for: .touchUpInside)
        choose2Button.addTarget(self, action: #selector(answerButtonPress), for: .touchUpInside)
        choose3Button.addTarget(self, action: #selector(answerButtonPress), for: .touchUpInside)
        
        
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    @objc func answerButtonPress(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
    
        quizBrain.nextQueation()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQueationText()
        
        let answers = quizBrain.getAnswers()
        choose1Button.setTitle(answers[0], for: .normal)
        choose2Button.setTitle(answers[1], for: .normal)
        choose3Button.setTitle(answers[2], for: .normal)
        
        choose1Button.backgroundColor = UIColor.clear
        choose2Button.backgroundColor = UIColor.clear
        choose3Button.backgroundColor = UIColor.clear
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }

}

extension ViewController {
    private func setView(){
        scoreLabel.text = "Score"
        questionLabel.text = "Question"
       
        buttonsStackView = UIStackView.init(axis: .vertical, distribution: .fillProportionally, subViews: [choose1Button, choose2Button, choose3Button])
        mainStackView = UIStackView.init(axis: .vertical, distribution: .fillProportionally, subViews: [scoreLabel, questionLabel, buttonsStackView])

        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
    }
    
    private func setupConstrains(){
        NSLayoutConstraint.activate([
//        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        
        choose1Button.heightAnchor.constraint(equalToConstant: 80),
        choose2Button.heightAnchor.constraint(equalToConstant: 80),
        choose3Button.heightAnchor.constraint(equalToConstant: 80),
        
        ])
    }
}

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview()
    }
}

