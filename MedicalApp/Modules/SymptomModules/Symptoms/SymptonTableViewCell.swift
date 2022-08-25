//
//  SymptonTableViewCell.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 28.07.2022.
//

import Foundation
import UIKit

class SymptomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "SymptomTableViewCell"
    
    private let symptomLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selected cell Logic
    override func setSelected(_ selected: Bool, animated: Bool) {
        backgroundColor = selected ? #colorLiteral(red: 0.02834429219, green: 0.5093373656, blue: 0.9314991832, alpha: 1) : .clear
        symptomLabel.textColor = selected ? .black : .white
    }
    
}

// MARK: - Private Methods
extension SymptomTableViewCell {
    private func setupConstraints() {
        contentView.addSubview(symptomLabel)
        NSLayoutConstraint.activate([
            symptomLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            symptomLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            symptomLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 9/10),
            symptomLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 9/15),
        ])
    }
}

// MARK: - Configure cell
extension SymptomTableViewCell {
    func configure(symptom: String) {
        symptomLabel.text = symptom
    }
}
