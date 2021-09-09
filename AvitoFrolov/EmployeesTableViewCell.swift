//
//  EmployeesTableViewCell.swift
//  AvitoFrolov
//
//  Created by Артем Фролов on 30.08.2021.
//

import UIKit

class EmployeesTableViewCell: UITableViewCell {
    
    private let nameLabel = UILabel()
    private let phoneLabel = UILabel()
    private let skillsLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(employeesList: Person) {
        nameLabel.text = employeesList.name
        phoneLabel.text = "Phone number: " + (employeesList.phoneNumber ?? "")
        skillsLabel.text = "Skills: " + (employeesList.skills?.joined(separator: ", ") ?? "")
    }
    
    private func configureUI() {
        nameLabel.font = nameLabel.font.withSize(25)
        phoneLabel.font = phoneLabel.font.withSize(18)
        skillsLabel.font = skillsLabel.font.withSize(18)
        skillsLabel.numberOfLines = .zero
        [nameLabel, phoneLabel, skillsLabel].forEach { contentView.addSubview($0) }
    }
    
    private func configureLayout() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        skillsLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.bottom.equalTo(-20)
        }
    }
}

extension EmployeesTableViewCell {
    class func reuseID() -> String {
        NSStringFromClass(EmployeesTableViewCell.self).components(separatedBy: ".").last ?? ""
    }
}
