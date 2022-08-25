//
//  ProtocolsViewController.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 16.08.2022.
//

import Foundation
import UIKit

class ProtocolViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var customView = ProtocolView()
    
    private let tProtocol: TProtocol
    private var tumors: [Tumor]?
    
    // MARK: - Init
    init(tProtocol: TProtocol) {
        self.tProtocol = tProtocol
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = tProtocol.name
        customView.delegate = self
    
    }

}

// MARK: - ProtocolViewControllerDelegate
extension ProtocolViewController: ProtocolViewControllerDelegate {
    
    func selectTumors(at row: Int) {
        tumors = tProtocol.descriptions[row].tumors
    }
    
    func returnDescriptionsCount() -> Int {
        return tProtocol.descriptions.count
    }
    
    func getDescription(at row: Int) -> Description {
        return tProtocol.descriptions[row]
    }
    
    func setTumor(at row: Int) {
        tumors = tProtocol.descriptions[row].tumors
    }
    
    func selectButtonTapped() {
        
        guard let tumors = tumors else {
            return
        }

        Manager.shared.addTumor(for: tProtocol.name, tumors: tumors)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
