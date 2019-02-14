//
//  ViewController.swift
//  ArcaniteTestIntern
//
//  Created by z on 13/02/2019.
//  Copyright © 2019 Ivan Sorokoletov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var fadeLabel: UILabel!
    @IBOutlet weak var fadeButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func textFieldDidChanged(_ sender: Any) {
        self.fadeButton.isEnabled = true
        
        if self.textField.text?.isEmpty ?? false {
            self.fadeButton.isEnabled = false
        }
    }
    
    @IBAction func fadeButtonTapped(_ sender: UIButton) {
        fadeLabel.text = textField.text
        fadeLabel.isHidden = false

        //MARK: set fade in animation
        makeFadeIn(fadeLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: set UI
        setInitialUI()
        
        fadeButton.backgroundColor = .clear
        fadeButton.layer.cornerRadius = 5
        fadeButton.layer.borderWidth = 1.5
        fadeButton.layer.borderColor = UIColor.black.cgColor
        fadeButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        
        //MARK: dismiss keyboard by return and tap
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        self.textField.delegate = self
    }
    
    //MARK: dismiss keyboard by return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func setInitialUI() {
        fadeLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        fadeLabel.isHidden = true
        fadeButton.isEnabled = false
    }
    
    func makeFadeIn(_ label: UILabel) {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 4
        flash.fromValue = 0
        flash.repeatCount = 1
        label.layer.add(flash, forKey: nil)
    }
}

extension MainViewController: UITextFieldDelegate {
    
}

