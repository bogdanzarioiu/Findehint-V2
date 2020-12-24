//
//  FourthLevelViewController.swift
//  ContainerViewControllers
//
//  Created by Bogdan on 12/6/20.
//  Copyright © 2020 Bogdan Zarioiu. All rights reserved.
//

import UIKit

class FourthLevelViewController: UIViewController {
    
    private var clueImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "JC")
        image.contentMode = .bottomRight
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let clueLabelWatermark: UILabel = {
        let clue = UILabel()
        clue.text = "JC3"
        clue.textColor = .black
        clue.font = UIFont(name: "AvenirNext-Heavy", size: 20)
        clue.translatesAutoresizingMaskIntoConstraints = false
        
        return clue
    }()
    
    private let mainClueLabel: UILabel = {
         let clue = UILabel()
         clue.text = "Wkh dqvzhu lv srwdwr"
         clue.textColor = .white
         clue.font = UIFont(name: "AvenirNext-Heavy", size: 20)
         clue.translatesAutoresizingMaskIntoConstraints = false
         
         return clue
     }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        setupClueImage()
        addWatermark()
        setupMainClueLabel()

    }
    
    private func setupClueImage() {
        view.addSubview(clueImageView)
        
        clueImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        clueImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        clueImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        clueImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    private func addWatermark() {
        clueImageView.addSubview(clueLabelWatermark)
        clueLabelWatermark.bottomAnchor.constraint(equalTo: clueImageView.bottomAnchor).isActive = true
        clueLabelWatermark.trailingAnchor.constraint(equalTo: clueImageView.trailingAnchor).isActive = true
    }
    
    private func setupMainClueLabel() {
        view.addSubview(mainClueLabel)
        mainClueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainClueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

   

}
