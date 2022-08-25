//
//  MainMenuView.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 14.08.2022.
//

import Foundation
import UIKit

class MainMenuView: UIView {
    
    // MARK: = Callbacks
    var callbackForSymptomButton: (() -> Void)?
    var callbackForDiagnosticButton: (() -> Void)?
    var callbackForReadyButton: (() -> Void)?
    
    // MARK: - Properties
    private lazy var symptomButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Клиническая\n картина", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(symptomButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var diagnosticButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Инструментальная\n диагностика", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(diagnosticButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var readyButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Заключение", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.05771823972, green: 0.6289868355, blue: 0.3161155581, alpha: 1)
        button.addTarget(self, action: #selector(readyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        label.text = "Дифференциальная диагностика глиальных опухолей головного мозга"
        label.numberOfLines = 0
        label.textAlignment = .center
    
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.03520448878, green: 0.05795302242, blue: 0.1181165203, alpha: 1)

        configure()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
extension MainMenuView {
    
    private func configure() {
        addSubviews([
            symptomButton,
            diagnosticButton,
            readyButton,
            titleLabel
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeTopAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 320),
            
            symptomButton.bottomAnchor.constraint(equalTo: diagnosticButton.topAnchor, constant: -20),
            symptomButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            symptomButton.widthAnchor.constraint(equalTo: diagnosticButton.widthAnchor),
            
            diagnosticButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            diagnosticButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            readyButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            readyButton.topAnchor.constraint(equalTo: diagnosticButton.bottomAnchor, constant: 20),
            readyButton.widthAnchor.constraint(equalTo: diagnosticButton.widthAnchor),
        ])
    }
    
    @objc private func symptomButtonTapped() {
        callbackForSymptomButton?()
    }
    
    @objc private func diagnosticButtonTapped() {
        callbackForDiagnosticButton?()
    }
    
    @objc private func readyButtonTapped() {
        callbackForReadyButton?()
    }
}
