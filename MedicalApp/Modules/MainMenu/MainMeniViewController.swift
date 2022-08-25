//
//  MainMeniViewController.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 14.08.2022.
//

import Foundation
import UIKit

class MainMenuViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var customView = MainMenuView()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCallbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - Private Methods
extension MainMenuViewController {
    
    private func setupCallbacks() {
        customView.callbackForSymptomButton = symptomButtonTapped
        customView.callbackForDiagnosticButton = diagnosticButtonTapped
        customView.callbackForReadyButton = readyButtonTapped
    }
    
    private func symptomButtonTapped() {
        let symptomsViewController = SymptomsViewController()
        
        self.navigationController?.pushViewController(symptomsViewController, animated: true)
    }
    
    private func diagnosticButtonTapped() {
        let diagnosticViewController = DiagnosticViewController()
        
        self.navigationController?.pushViewController(diagnosticViewController, animated: true)
    }
    
    private func readyButtonTapped() {
        
        if Manager.shared.syndroms.count == 0 {
            showAlertNoSyndromes()
            return
        }
        
        if Manager.shared.tumors.count < 8 {
            showAlertNoTumors()
            return
        }
        
        let resultViewController = ResultViewController()
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }

}

// MARK: - Alerts
extension MainMenuViewController {
    
    private func showAlertNoSyndromes() {
        let alert = UIAlertController(title: "Пожалуйста заполните клиническую картину", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .cancel))
        present(alert, animated: true)
    }
    
    private func showAlertNoTumors() {
        let alert = UIAlertController(title: "Пожалуйста заполните заполните полностью все поля инструментальной диагностики", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .cancel))
        present(alert, animated: true)
    }
    
}
