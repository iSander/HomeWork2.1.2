//
//  TrafficLightViewController.swift
//  HomeWork2.1.2
//
//  Created by Alex Sander on 29.01.2020.
//  Copyright © 2020 Alex Sander. All rights reserved.
//

import UIKit

enum TrafficLightState {
    case disable
    case red
    case yellow
    case green
}

class TrafficLightViewController: UIViewController {
    
    // MARK: - IB IBOutlet

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var actionButton: UIButton!
    
    // MARK: - Properties
    
    var trafficLightState: TrafficLightState = .disable
    
    let trafficLightAlphaDisabled: CGFloat = 0.3
    let trafficLightAlphaEnabled: CGFloat = 1.0
    
    // MARK: - Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.backgroundColor = .red
        redView.alpha = trafficLightAlphaDisabled
        yellowView.backgroundColor = .yellow
        yellowView.alpha = trafficLightAlphaDisabled
        greenView.backgroundColor = .green
        greenView.alpha = trafficLightAlphaDisabled
        
        updateUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateUI()
    }
    
    // MARK: - IB Actions
    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
        actionButton.setTitle("NEXT", for: .normal)
        
        switch trafficLightState {
        case .disable, .green:
            trafficLightState = .red
        case .red:
            trafficLightState = .yellow
        case .yellow:
            trafficLightState = .green
        }
        
        redView.alpha = (trafficLightState == .red) ? trafficLightAlphaEnabled : trafficLightAlphaDisabled
        yellowView.alpha = (trafficLightState == .yellow) ? trafficLightAlphaEnabled : trafficLightAlphaDisabled
        greenView.alpha = (trafficLightState == .green) ? trafficLightAlphaEnabled : trafficLightAlphaDisabled
    }
    
    // MARK: - Private Methods
    
    private func updateUI() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
}

