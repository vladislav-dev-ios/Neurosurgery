//
//  AddSymptomView.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 24.08.2022.
//

import Foundation
import UIKit

class AddSymptomView: UIView {
    
    // MARK: - Properties
    weak var delegate: AddSymptomViewControllerDelegate?
    
    private lazy var addButton : CustomButton = {
        let button = CustomButton()
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Добавить", for: .normal)
        return button
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Добавление симптоама"
        label.textColor = .white
        return label
    }()
    
    private lazy var symptomTableView : CustomTableView = {
        let table = CustomTableView()
        table.register(SymptomTableViewCell.self, forCellReuseIdentifier: SymptomTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
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
extension AddSymptomView {
    private func configure() {
        addSubviews([
            addButton,
            titleLabel,
            symptomTableView
        ])
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -20),
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: safeTopAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            symptomTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 13),
            symptomTableView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -13),
            symptomTableView.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 11),
            symptomTableView.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -11),
        ])
    }
    
    @objc private func addButtonTapped() {
        delegate?.addButtonTapped()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension AddSymptomView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        delegate?.retutnSymptomsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SymptomTableViewCell.identifier, for: indexPath) as! SymptomTableViewCell
        
        let symptom = delegate?.getSymptom(at: indexPath.row)
        
        if let symptom = symptom {
            cell.configure(symptom: symptom.rawValue)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectSymptom(at: indexPath.row)
    }
    
}
