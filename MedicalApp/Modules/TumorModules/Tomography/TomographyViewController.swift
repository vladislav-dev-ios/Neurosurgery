//
//  TomographyViewController.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 15.08.2022.
//

import Foundation
import UIKit

class TomographyViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var protocolsTableView: CustomTableView = {
        let table = CustomTableView()
        table.register(TomographyTableViewCell.self, forCellReuseIdentifier: TomographyTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    private let tomography: Tomography
    
    // MARK: - Init
    init(tomography: Tomography) {
        self.tomography = tomography
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.03520448878, green: 0.05795302242, blue: 0.1181165203, alpha: 1)
        title = tomography.name
        
        addTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        protocolsTableView.reloadData()
    }
    
}

// MARK: - Private Methods
extension TomographyViewController {
    private func addTableView() {
        view.addSubview(protocolsTableView)
        NSLayoutConstraint.activate([
            protocolsTableView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 20),
            protocolsTableView.leftAnchor.constraint(equalTo: view.safeLeftAnchor, constant: 10),
            protocolsTableView.rightAnchor.constraint(equalTo: view.safeRightAnchor, constant: -10),
            protocolsTableView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -20)
        ])
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension TomographyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tomography.protocols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TomographyTableViewCell.identifier, for: indexPath) as! TomographyTableViewCell
        
        let tProtocol = tomography.protocols[indexPath.row]
        
        cell.configure(tomography: tProtocol.name)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tProtocol = tomography.protocols[indexPath.row]
        
        let protocolViewController = ProtocolViewController(tProtocol: tProtocol)
        
        self.navigationController?.pushViewController(protocolViewController, animated: true)
    }
}
