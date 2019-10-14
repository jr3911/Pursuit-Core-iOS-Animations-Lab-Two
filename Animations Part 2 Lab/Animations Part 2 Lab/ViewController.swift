//
//  ViewController.swift
//  Animations Part 2 Lab
//
//  Created by Jason Ruan on 10/14/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    lazy var linearButton: UIButton = {
        let button = UIButton()
        button.isSelected = true
        button.setTitle("Linear", for: .normal)
        button.addTarget(self, action: #selector(buttonpressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var easeInButton: UIButton = {
        let button = UIButton()
        button.isSelected = true
        button.setTitle("EaseIn", for: .normal)
        button.addTarget(self, action: #selector(buttonpressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var easeOutButton: UIButton = {
        let button = UIButton()
        button.isSelected = true
        button.setTitle("EaseOut", for: .normal)
        button.addTarget(self, action: #selector(buttonpressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var easeInEaseOutButton: UIButton = {
        let button = UIButton()
        button.isSelected = true
        button.setTitle("EaseInEaseOut", for: .normal)
        button.addTarget(self, action: #selector(buttonpressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var topButtonStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .equalSpacing
        sv.spacing = 30
        return sv
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var animateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Animate", for: .normal)
        button.addTarget(self, action: #selector(animatedButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var bottomButtons = [self.resetButton, self.animateButton]
    
    lazy var bottomButtonStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .equalSpacing
        sv.spacing = 30
        return sv
    }()
    
    lazy var linearView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "beachBall")
        return view
    }()
    
    lazy var easeInView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "beachBall")
        return view
    }()
    
    lazy var easeOutView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "beachBall")
        return view
    }()
    
    lazy var easeInEaseOutView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "beachBall")
        return view
    }()
    
    //MARK: LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubviews()
        setUpTopButtonsStackView()
        setUpBottomButtonStackView()
        setUpImages()
    }
    
    //MARK: Private Functions
    private func addSubviews() {
        view.addSubview(topButtonStackView)
        view.addSubview(bottomButtonStackView)
        view.addSubview(linearView)
        view.addSubview(easeInView)
        view.addSubview(easeOutView)
        view.addSubview(easeInEaseOutView)
    }
    
    
    //MARK: Constraints
    private func setUpTopButtonsStackView() {
        let topButtons: [UIButton] = [linearButton, easeInButton, easeOutButton, easeInEaseOutButton]
        
        topButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topButtonStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            topButtonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topButtonStackView.widthAnchor.constraint(equalToConstant: view.frame.width),
            topButtonStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        for button in topButtons {
            topButtonStackView.addSubview(button)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(.systemBlue, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 14)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 40),
                button.widthAnchor.constraint(equalToConstant: view.frame.width / 4)
            ])
        }
        
        NSLayoutConstraint.activate([
            linearButton.leadingAnchor.constraint(equalTo: topButtonStackView.leadingAnchor),
            easeInButton.leadingAnchor.constraint(equalTo: linearButton.trailingAnchor),
            easeOutButton.leadingAnchor.constraint(equalTo: easeInButton.trailingAnchor),
            easeInEaseOutButton.leadingAnchor.constraint(equalTo: easeOutButton.trailingAnchor)
        ])
    }
    
    private func setUpBottomButtonStackView() {
        bottomButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomButtonStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            bottomButtonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            bottomButtonStackView.widthAnchor.constraint(equalToConstant: view.frame.width),
            bottomButtonStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        for button in bottomButtons {
            bottomButtonStackView.addSubview(button)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(.systemBlue, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 14)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 40),
                button.widthAnchor.constraint(equalToConstant: view.frame.width / 4)
            ])
        }
        
        NSLayoutConstraint.activate([
            resetButton.leadingAnchor.constraint(equalTo: bottomButtonStackView.leadingAnchor),
            animateButton.trailingAnchor.constraint(equalTo: bottomButtonStackView.trailingAnchor)
        ])
    }
    
    private func setUpImages() {
        let imageViews = [linearView, easeInView, easeOutView, easeInEaseOutView]
        
        for imageview in imageViews {
            imageview.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                imageview.widthAnchor.constraint(equalToConstant: 50),
                imageview.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
        NSLayoutConstraint.activate([
            linearView.centerXAnchor.constraint(equalTo: linearButton.centerXAnchor),
            linearView.topAnchor.constraint(equalTo: linearButton.bottomAnchor, constant: 30),
            
            easeInView.centerXAnchor.constraint(equalTo: easeInButton.centerXAnchor),
            easeInView.topAnchor.constraint(equalTo: easeInButton.bottomAnchor, constant: 30),
            
            easeOutView.centerXAnchor.constraint(equalTo: easeOutButton.centerXAnchor),
            easeOutView.topAnchor.constraint(equalTo: easeOutButton.bottomAnchor, constant: 30),
            
            easeInEaseOutView.centerXAnchor.constraint(equalTo: easeInEaseOutButton.centerXAnchor),
            easeInEaseOutView.topAnchor.constraint(equalTo: easeInEaseOutButton.bottomAnchor, constant: 30)
        ])
        
    }
    
    //MARK: Objective-C Functions
    @objc func buttonpressed(sender: UIButton) {
        switch sender {
        case linearButton:
            linearView.isHidden = !linearView.isHidden
        case easeInButton:
            easeInView.isHidden = !easeInView.isHidden
        case easeOutButton:
            easeOutView.isHidden = !easeOutView.isHidden
        case easeInEaseOutButton:
            easeInEaseOutView.isHidden = !easeInEaseOutView.isHidden
        default:
            print("Not a valid option")
        }
    }
    
    @objc func resetButtonPressed() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.linearView.transform = CGAffineTransform.identity
            self.easeInView.transform = CGAffineTransform.identity
            self.easeOutView.transform = CGAffineTransform.identity
            self.easeInEaseOutView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    @objc func animatedButtonPressed() {
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveLinear, animations: {
            self.linearView.transform = CGAffineTransform(translationX: 0, y: self.view.safeAreaLayoutGuide.layoutFrame.height - 200)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseIn, animations: {
            self.easeInView.transform = CGAffineTransform(translationX: 0, y: self.view.safeAreaLayoutGuide.layoutFrame.height - 200)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseOut, animations: {
            self.easeOutView.transform = CGAffineTransform(translationX: 0, y: self.view.safeAreaLayoutGuide.layoutFrame.height - 200)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseInOut, animations: {
            self.easeInEaseOutView.transform = CGAffineTransform(translationX: 0, y: self.view.safeAreaLayoutGuide.layoutFrame.height - 200)
        }, completion: nil)
    }
    
}

