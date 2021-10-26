//
//  EmployeesDataSource.swift
//  AvitoFrolov
//
//  Created by Артем Фролов on 30.08.2021.
//

import UIKit

class EmployeesDataSource: NSObject {
    var employeesList = [Person]()
}

extension EmployeesDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employeesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard employeesList.count > indexPath.row,
              let cell = tableView.dequeueReusableCell(
            withIdentifier: EmployeesTableViewCell.reuseID(),
            for: indexPath
        ) as? EmployeesTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(employeesList: employeesList[indexPath.row])
        return cell
    }
}
