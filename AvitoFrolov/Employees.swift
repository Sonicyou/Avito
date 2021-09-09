//
//  Employees.swift
//  AvitoFrolov
//
//  Created by Артем Фролов on 30.08.2021.
//

import Foundation

struct Employees: Codable {
    let company: Company
}

struct Company: Codable {
    let name: String
    let employees: [Employee]
}

struct Employee: Codable {
    let name: String
    let phone_number: String
    let skills: [String]
}
