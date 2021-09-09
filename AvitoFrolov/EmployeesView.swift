//
//  EmployeesView.swift
//  AvitoFrolov
//
//  Created by Артем Фролов on 30.08.2021.
//

import UIKit
import SnapKit

class EmployeesView: UIView {
    
    let tableView = UITableView.init(frame: .zero)
    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        [titleLabel, tableView].forEach { addSubview($0) }
        titleLabel.text = "Employee List"
        titleLabel.font = titleLabel.font.withSize(30)
        tableView.register(EmployeesTableViewCell.self, forCellReuseIdentifier: EmployeesTableViewCell.reuseID())
        tableView.estimatedRowHeight = 44.0
    }
    
    private func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(25)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.trailing.leading.bottom.equalToSuperview()
        }
    }
}
