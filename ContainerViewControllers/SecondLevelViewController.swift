//
//  SecondLevelViewController.swift
//  ContainerViewControllers
//
//  Created by Bogdan on 12/6/20.
//  Copyright © 2020 Bogdan Zarioiu. All rights reserved.
//

import UIKit

class SecondLevelViewController: UIViewController {
    
    private let clueLabel: UILabel = {
        let clue = UILabel()
        clue.text = "JACK"
        clue.font = UIFont(name: "AvenirNext-Heavy", size: 50)
        clue.translatesAutoresizingMaskIntoConstraints = false
        
        //5225
        return clue
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        setupClueLabel()

        // Do any additional setup after loading the view.
    }
    
    private func setupClueLabel() {
        view.addSubview(clueLabel)
        clueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        clueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
    }

   

}
