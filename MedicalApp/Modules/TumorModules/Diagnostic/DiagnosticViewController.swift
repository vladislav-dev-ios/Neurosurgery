//
//  DiagnosticViewController.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 15.08.2022.
//

import Foundation
import UIKit

class DiagnosticViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var tomographyTableView: CustomTableView = {
        let table = CustomTableView()
        table.register(DiagnosticTableViewCell.self, forCellReuseIdentifier: DiagnosticTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    private lazy var tomography = Tomography.createBasicTomography()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.03520448878, green: 0.05795302242, blue: 0.1181165203, alpha: 1)
        title = "Диагностика"
        
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: UIColor.white]
        
        addTableView()
    }

}

// MARK: - Private Methods
extension DiagnosticViewController {
    private func addTableView() {
        view.addSubview(tomographyTableView)
        NSLayoutConstraint.activate([
            tomographyTableView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 20),
            tomographyTableView.leftAnchor.constraint(equalTo: view.safeLeftAnchor, constant: 10),
            tomographyTableView.rightAnchor.constraint(equalTo: view.safeRightAnchor, constant: -10),
            tomographyTableView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -20)
        ])
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension DiagnosticViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tomography.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiagnosticTableViewCell.identifier, for: indexPath) as! DiagnosticTableViewCell
        
        let tomography = tomography[indexPath.row]
        
        cell.configure(tomography: tomography.name)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tomography = tomography[indexPath.row]
        
        let tomographyViewController = TomographyViewController(tomography: tomography)
        
        self.navigationController?.pushViewController(tomographyViewController, animated: true)
    }
    
}
