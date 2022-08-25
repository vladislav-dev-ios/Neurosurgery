//
//  ResultViewController.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 18.08.2022.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var tumors = Manager.shared.calculateProbalityOfResultTumors()
    private lazy var syndroms = Manager.shared.syndroms
    
    private lazy var customView = ResultView()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Заключение"
        
        customView.delegate = self
    }
}

// MARK: - ResultViewControllerDelegate
extension ResultViewController: ResultViewControllerDelegate {
    
    func returnTumorsCount() -> Int {
        return tumors.count
    }
    
    func getSyndrome(at row: Int) -> Syndrome {
        return syndroms[row]
    }
    
    func getTumor(at row: Int) -> TumorModel {
        return tumors[row]
    }
    
    func returnSyndromsCount() -> Int {
        return syndroms.count
    }
}
