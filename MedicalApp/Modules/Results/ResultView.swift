//
//  ResultView.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 18.08.2022.
//

import Foundation
import UIKit

class ResultView: UIView {
    
    // MARK: - Properties
    weak var delegate: ResultViewControllerDelegate?
    
    private lazy var tumorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.text = "Результаты диагностики"
        return label
    }()
    
    private lazy var syndromLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Клиническая картина"
        return label
    }()
    
    private lazy var syndromsTableView: CustomTableView = {
        let table = CustomTableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(SyndromTableViewCell.self, forCellReuseIdentifier: SyndromTableViewCell.identifier)
        return table
    }()
    
    private lazy var tumorsTableView: CustomTableView = {
        let table = CustomTableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(TumorTableViewCell.self, forCellReuseIdentifier: TumorTableViewCell.identifier)
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
extension ResultView {
    private func configure() {
        addSubviews([
            syndromsTableView,
            tumorsTableView,
            tumorLabel,
            syndromLabel
        ])
        NSLayoutConstraint.activate([
            tumorLabel.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 10),
            tumorLabel.topAnchor.constraint(equalTo: safeTopAnchor, constant: 10),
            
            tumorsTableView.topAnchor.constraint(equalTo: tumorLabel.bottomAnchor, constant: 5),
            tumorsTableView.leftAnchor.constraint(equalTo: tumorLabel.leftAnchor),
            tumorsTableView.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -10),
            tumorsTableView.bottomAnchor.constraint(equalTo: centerYAnchor),
            
            syndromLabel.topAnchor.constraint(equalTo: tumorsTableView.bottomAnchor, constant: 10),
            syndromLabel.leftAnchor.constraint(equalTo: tumorLabel.leftAnchor),
            
            syndromsTableView.topAnchor.constraint(equalTo: syndromLabel.bottomAnchor, constant: 5),
            syndromsTableView.leftAnchor.constraint(equalTo: syndromLabel.leftAnchor),
            syndromsTableView.rightAnchor.constraint(equalTo: tumorsTableView.rightAnchor),
            syndromsTableView.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -10)
            
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ResultView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case syndromsTableView:
            return delegate?.returnSyndromsCount() ?? 0
        case tumorsTableView:
            return delegate?.returnTumorsCount() ?? 0
        default:
            return 0
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case syndromsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: SyndromTableViewCell.identifier, for: indexPath) as! SyndromTableViewCell
            
            let syndrom = delegate?.getSyndrome(at: indexPath.row)
            
            if let syndrom = syndrom {
                cell.configure(symptom: syndrom.name)
            }
            
            cell.isUserInteractionEnabled = false
            return cell
            
        case tumorsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: TumorTableViewCell.identifier, for: indexPath) as! TumorTableViewCell
            
            let tumor = delegate?.getTumor(at: indexPath.row)
            
            if let tumor = tumor {
                cell.configure(tumor: tumor.tumor.rawValue, percent: tumor.percent)
            }
            
          
            cell.isUserInteractionEnabled = false
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
}
