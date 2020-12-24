//
//  ViewController.swift
//  ContainerViewControllers
//
//  Created by Bogdan on 12/6/20.
//  Copyright © 2020 Bogdan Zarioiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var currentLevel = 1
    let secondVC = SecondLevelViewController()
    let thirdVC = ThirdLevelViewController()
    let fourthVC = FourthLevelViewController()
    let fifthVC = FifthLevelViewController()
    
    
    
    // TODO: - I need to create a view containing the current level and the score that I'll show on each level, on top part of the screen I think. I need to think if I'll show hints or not. Now I say no, because it's easier forr me and makes the game harder!😈
    //Maybe to add the title of the game in binary
    
    //FIN or F1N
    //DEH or D3H
    //INT or 1NT --> This will be the AppStore icon!
    private let introductionTextView: UITextView = {
        let clue = UITextView()
        clue.text = "H3110!\nWelcome to FINDEHINT!\nThis game is simple: answer the puzzles and get as far as you can in the game.\nSome puzzles may require a bit of research from your side in order to solve them.\nPay attention to the clues and good luck!"
        clue.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        clue.font = UIFont(name: "AvenirNext-Heavy", size: 16)
        //clue.textColor = .black
        clue.textContainer.lineBreakMode = .byWordWrapping
        clue.isEditable = false
        clue.translatesAutoresizingMaskIntoConstraints = false
        return clue
    }()
    
    lazy var answerTextField: UITextField = {
        var answer = UITextField()
        answer.delegate = self
     
        answer.borderStyle = .line
        answer.layer.borderWidth = 3
        answer.layer.borderColor = UIColor.black.cgColor
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray,
            NSAttributedString.Key.font : UIFont(name: "Avenir-Heavy", size: 20)!
        ]
    
        answer.attributedPlaceholder = NSAttributedString(string: "   Enter ok", attributes:attributes)
        answer.textColor = .black
        answer.autocapitalizationType = .none
        answer.font = UIFont(name: "Avenir-Heavy", size: 20)
        
        let leftSpacer = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: answer.frame.size.height))
        leftSpacer.backgroundColor = .systemBlue
        answer.leftView = leftSpacer
        answer.leftViewMode = .always
        
        answer.translatesAutoresizingMaskIntoConstraints = false
        return answer
    }()
    
    private var nextLevelButton: UIButton = {
        var next = UIButton()
        next.setTitle("Next level", for: .normal)
        next.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
        next.setTitleColor(.white, for: .normal)
        next.alpha = 0
        next.addTarget(self, action: #selector(handleNextPressed(_:)), for: .touchUpInside)
        next.translatesAutoresizingMaskIntoConstraints = false
        
        
        return next
    }()
    
    override var prefersStatusBarHidden: Bool {
        true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupIntroductionText()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)

        
        //Listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        addNextLevelButtonConstraints()
        addAnswerConstraints()
    }
    
    @objc private func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        answerTextField.resignFirstResponder()
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            
            view.frame.origin.y = -keyboardRect.height
        } else {
            view.frame.origin.y = 0
        }
            
        
        
    }
    
    deinit {
          NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
          NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
          NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
      }
    
    @objc private func handleNextPressed(_ sender: UIButton) {
        
        currentLevel += 1
        switch currentLevel {
        case 2:
            addLevel(level: secondVC)
            addLevelConstraints(level: secondVC)
            answerTextField.placeholder = "  Enter the solution"
            answerTextField.text = ""
            answerTextField.keyboardType = .decimalPad
            nextLevelButton.alpha = 0
        case 3:
            addLevel(level: thirdVC)
            addLevelConstraints(level: thirdVC)
            answerTextField.placeholder = "  Enter the solution"
            answerTextField.text = ""
            nextLevelButton.alpha = 0
        case 4:
            addLevel(level: fourthVC)
            addLevelConstraints(level: fourthVC)
            answerTextField.placeholder = "  Enter the solution"
            answerTextField.text = ""
            answerTextField.keyboardType = .asciiCapable
            nextLevelButton.alpha = 0
        case 5:
            addLevel(level: fifthVC)
            addLevelConstraints(level: fifthVC)
            answerTextField.placeholder = "  Enter the solution"
            answerTextField.text = ""
            answerTextField.keyboardType = .asciiCapable
            nextLevelButton.alpha = 0
        default:
            print("No more levels")
            
        }
        
        
        
    }
    
    private func addLevel(level: UIViewController) {
        addChild(level)
        self.view.addSubview(level.view)
        level.didMove(toParent: self)
        
        //addLevelConstraints()
    }
    
    private func setupIntroductionText() {
        view.addSubview(introductionTextView)
        
        introductionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        introductionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        introductionTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        introductionTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
//        introductionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        introductionTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
    }
    
    private func addLevelConstraints(level: UIViewController) {
        level.view.translatesAutoresizingMaskIntoConstraints = false
        
        level.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        level.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        level.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        level.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75).isActive = true

        
    }
    
    private func addNextLevelButtonConstraints() {
        view.addSubview(nextLevelButton)
        
        nextLevelButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        nextLevelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nextLevelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nextLevelButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        

    }
    
    private func addAnswerConstraints() {
        view.addSubview(answerTextField)
        
        answerTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        answerTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        answerTextField.bottomAnchor.constraint(equalTo: nextLevelButton.topAnchor, constant: -40).isActive = true
        answerTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }


}

//add a switch statement to handle the correct answer depending on the current level
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch currentLevel {
        case 1:
            if textField.text == "ok" {
                nextLevelButton.alpha = 1
                nextLevelButton.backgroundColor = .systemGreen
                nextLevelButton.isEnabled = true
            }
        case 2:
            if textField.text == "5225" {
                nextLevelButton.alpha = 1
                nextLevelButton.backgroundColor = .systemGreen
                nextLevelButton.isEnabled = true
                
            }
        case 3:
            if textField.text == "34" {
                nextLevelButton.alpha = 1
                nextLevelButton.backgroundColor = .systemGreen
                nextLevelButton.isEnabled = true
                
            }
        case 4:
            if textField.text == "potato" {
                nextLevelButton.alpha = 1
                nextLevelButton.backgroundColor = .systemGreen
                nextLevelButton.isEnabled = true
                
            }
        default:
            print(currentLevel)
            nextLevelButton.alpha = 0
            nextLevelButton.backgroundColor = .systemRed
            nextLevelButton.isEnabled = false
        
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        nextLevelButton.alpha = 0
        //nextLevelButton.backgroundColor = .clear
    }
    
}
