//
//  StatusLabel.swift
//  Junior-Test-Task
//
//  Created by Данил Акимов on 14.03.2023.
//

import UIKit

class StatusLabel: UILabel {
    
    public var isValid = false {
        didSet {
            if self.isValid {
                setValidSettings()
            } else {
                setNotValidSettings()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = "Check your mail"
        textColor = #colorLiteral(red: 0.9450980392, green: 0.9333333333, blue: 0.862745098, alpha: 1)
        font = UIFont(name: "Apple SD Gothik Neo", size: 16)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setNotValidSettings() {
        text = "Mail is not valid. Example: name@domain.ru"
        textColor = .red
    }
    
    private func setValidSettings() {
        text = "Mail is  valid"
        textColor = .green
    }
    
    public func setDefaultSettings() {
        configure()
    }
}
