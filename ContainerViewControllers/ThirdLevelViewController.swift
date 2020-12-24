//
//  ThirdLevelViewController.swift
//  ContainerViewControllers
//
//  Created by Bogdan on 12/6/20.
//  Copyright © 2020 Bogdan Zarioiu. All rights reserved.
//

import UIKit

class ThirdLevelViewController: UIViewController {
    
    
    private let clueLabel: UILabel = {
          let clue = UILabel()
          clue.text = "＋"
          clue.font = UIFont(name: "AvenirNext-Heavy", size: 50)
          clue.translatesAutoresizingMaskIntoConstraints = false
          
          //5225
          return clue
      }()
    
    private let clueTextView: UITextView = {
        let clue = UITextView()
        clue.text = "You need three numbers to pass this level. 29 is the second. Find the other two and reduce them to one."
        clue.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        clue.font = UIFont(name: "AvenirNext-Heavy", size: 16)
        //clue.textColor = .black
        clue.textContainer.lineBreakMode = .byWordWrapping
        clue.isEditable = false
        clue.translatesAutoresizingMaskIntoConstraints = false
        return clue
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        setupClueLabel()
        setupClueTextView()

        // Do any additional setup after loading the view.
    }
    
    private func setupClueLabel() {
        view.addSubview(clueLabel)
        clueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 150).isActive = true
        clueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupClueTextView() {
        view.addSubview(clueTextView)
        clueTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        clueTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        clueTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        clueTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    

   

}
