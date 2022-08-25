//
//  ProtocolTableViewCell.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 15.08.2022.
//

import Foundation
import UIKit

class ProtocolTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "ProtocolTableViewCell"
    
    private lazy var protocolLabel: UILabel = {
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
        protocolLabel.textColor = selected ? .black : .white
    }
    
}

// MARK: - Private Methods
extension ProtocolTableViewCell {
    private func setupConstraints() {
        contentView.addSubview(protocolLabel)
        NSLayoutConstraint.activate([
            protocolLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            protocolLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            protocolLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 9/10),
            protocolLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 9/12),
        ])
    }
}

// MARK: - Configure cell
extension ProtocolTableViewCell {
    func configure(tProtocol: String) {
        protocolLabel.text = tProtocol
    }
}
