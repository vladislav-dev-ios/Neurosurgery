//
//  ProtocolView.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 23.08.2022.
//

import Foundation
import UIKit

class ProtocolView: UIView {
        
    // MARK: - Properties
    weak var delegate: ProtocolViewControllerDelegate?
    
    private lazy var descriptionsTableView: CustomTableView = {
        let table = CustomTableView()
        table.register(ProtocolTableViewCell.self, forCellReuseIdentifier: ProtocolTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    private lazy var selectButton: UIButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Выбрать", for: .normal)
        button.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
        return button
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
extension ProtocolView {
    private func configure() {
        addSubviews([
            descriptionsTableView,
            selectButton
        ])
        NSLayoutConstraint.activate([
            descriptionsTableView.topAnchor.constraint(equalTo: safeTopAnchor, constant: 20),
            descriptionsTableView.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 10),
            descriptionsTableView.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -10),
            descriptionsTableView.bottomAnchor.constraint(equalTo: selectButton.topAnchor, constant: -20),
            
            selectButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -20),
            selectButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    @objc private func selectButtonTapped() {
        delegate?.selectButtonTapped()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ProtocolView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        delegate?.returnDescriptionsCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProtocolTableViewCell.identifier, for: indexPath) as! ProtocolTableViewCell

        let description = delegate?.getDescription(at: indexPath.row)

        if let description = description {
            cell.configure(tProtocol: description.name)
        }
    
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectTumors(at: indexPath.row)
    }
    
}
