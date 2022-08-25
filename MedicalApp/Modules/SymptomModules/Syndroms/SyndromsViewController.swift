//
//  SyndromsViewController.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 28.07.2022.
//

import Foundation
import UIKit

class SyndromsViewController: UIViewController {
    
    // MARK: - Properties
    private var syndroms = [Syndrome]()
    private var symptoms: [Symptom]
    
    private lazy var syndromeTableView : CustomTableView = {
        let table = CustomTableView()
        table.register(SyndromTableViewCell.self, forCellReuseIdentifier: SyndromTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: - Init
    init(symptoms: [Symptom]) {
        self.symptoms = symptoms
        
        super.init(nibName: nil, bundle: nil)
        
        self.searchSyndrome()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Возможные синдромы"
        view.backgroundColor = #colorLiteral(red: 0.03520448878, green: 0.05795302242, blue: 0.1181165203, alpha: 1)
    
        setupConstraints()
    }

}

// MARK: - Private Methods
extension SyndromsViewController {
    
    private func setupConstraints() {
        view.addSubview(syndromeTableView)
        NSLayoutConstraint.activate([
            syndromeTableView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 10),
            syndromeTableView.leftAnchor.constraint(equalTo: view.safeLeftAnchor, constant: 10),
            syndromeTableView.rightAnchor.constraint(equalTo: view.safeRightAnchor, constant: -10),
            syndromeTableView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -10)
        ])
    }
    
    private func searchSyndrome() {
        
        let syndromes = Syndrome.getSyndromes()
        
        for syndrom in syndromes {
            for symptomSyndrom in syndrom.symptoms {
                for symptom in symptoms {
                    if symptom.rawValue == symptomSyndrom.rawValue {
                        if syndroms.contains(where: { newSyndrom in
                            newSyndrom.name == syndrom.name
                        }) {
                            break
                        }
                        syndroms.append(syndrom)
                        break
                    }
                }
            }
        }
        Manager.shared.syndroms = syndroms
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SyndromsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return syndroms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SyndromTableViewCell.identifier, for: indexPath) as! SyndromTableViewCell
        
        let syndrome = syndroms[indexPath.row]
        
        cell.configure(symptom: syndrome.name)
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
}
