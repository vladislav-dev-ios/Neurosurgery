//
//  SymptomsView.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 24.08.2022.
//

import Foundation
import UIKit

class SymptomsView: UIView {
    
    // MARK: - Properties
    weak var delegate: SymptomsViewControllerDelegate?

    private lazy var symptomTableView : CustomTableView = {
        let table = CustomTableView()
        table.register(SymptomTableViewCell.self, forCellReuseIdentifier: SymptomTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var addSymptomButton : CustomButton = {
        let button = CustomButton()
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Добавить", for: .normal)
        return button
    }()
    
    private lazy var nextButton : CustomButton = {
        let button = CustomButton()
        button.backgroundColor = #colorLiteral(red: 0.05771823972, green: 0.6289868355, blue: 0.3161155581, alpha: 1)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Готово", for: .normal)
        return button
    }()
    
    private lazy var deletaAllButton : CustomButton = {
        let button = CustomButton()
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.810474515, blue: 0.2384103239, alpha: 1)
        button.addTarget(self, action: #selector(deleteAllButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("X", for: .normal)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.03520448878, green: 0.05795302242, blue: 0.1181165203, alpha: 1)

        congifure()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Private Methods
extension SymptomsView {
    private func congifure() {
        addSubviews([
            symptomTableView,
            addSymptomButton,
            nextButton,
            deletaAllButton
        ])
        NSLayoutConstraint.activate([
            symptomTableView.topAnchor.constraint(equalTo: addSymptomButton.bottomAnchor, constant: 10),
            symptomTableView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20),
            symptomTableView.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 20),
            symptomTableView.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -20),
            
            addSymptomButton.leftAnchor.constraint(equalTo: symptomTableView.leftAnchor),
            addSymptomButton.topAnchor.constraint(equalTo: safeTopAnchor, constant: 20),
            
            nextButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -40),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            deletaAllButton.rightAnchor.constraint(equalTo: symptomTableView.rightAnchor),
            deletaAllButton.bottomAnchor.constraint(equalTo: addSymptomButton.bottomAnchor)
        ])
    }

    @objc private func addButtonTapped() {
        delegate?.addButtonTapped()
    }
    
    @objc private func nextButtonTapped() {
        delegate?.nextButtonTapped()
    }
    
    @objc private func deleteAllButtonTapped() {
        delegate?.deleteButtonTapped()
    }
}

// MARK: - Public Methods
extension SymptomsView {
    func reloadTableViewData() {
        symptomTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SymptomsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.returnSymptomsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SymptomTableViewCell.identifier, for: indexPath) as! SymptomTableViewCell
        
        let symptom = delegate?.getSymptom(at: indexPath.row)
         
        if let symptom = symptom {
            cell.configure(symptom: symptom.rawValue)
        }
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = false
        return cell
    }
    
}
