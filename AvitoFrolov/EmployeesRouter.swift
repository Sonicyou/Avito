//
//  EmployeesRouter.swift
//  AvitoFrolov
//
//  Created by Артем Фролов on 06.09.2021.
//

import UIKit

class EmployeesRouter {
    
    weak var viewController: UIViewController?
    
    func showError(_ error: Error, completion: @escaping () -> Void) {
        makeAlertController(title: error.localizedDescription, message: nil, completion: completion)
    }
    
    private func makeAlertController(title: String?, message: String?, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let refreshButton = UIAlertAction(title: "Refresh", style: .default) { _ in
            completion()
        }
        let cancelButton = UIAlertAction(title: "Close", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(refreshButton)
        alert.addAction(cancelButton)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
