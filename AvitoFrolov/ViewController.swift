//
//  ViewController.swift
//  AvitoFrolov
//
//  Created by Артем Фролов on 30.08.2021.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = ViewModel()
    private let employeesView = EmployeesView()
    private let dataSource = EmployeesDataSource()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureLayout()
        bind()
    }

    private func configure() {
        viewModel.router.viewController = self
        view.addSubview(employeesView)
        employeesView.tableView.dataSource = dataSource
    }
    
    private func configureLayout() {
        employeesView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bind() {
        viewModel.completionEmployeesList = { [weak self] list in
            self?.dataSource.employeesList = list
            DispatchQueue.main.async {
                self?.employeesView.tableView.reloadData()
            }
        }
        viewModel.getEmployeesList()
    }
}
