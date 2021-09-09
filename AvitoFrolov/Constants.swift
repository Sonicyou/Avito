//
//  Constants.swift
//  AvitoFrolov
//
//  Created by Артем Фролов on 30.08.2021.
//

import Foundation

typealias EmployeesList = (([Person]) -> Void)
typealias EmployeesListCompletion = (Result<[Employee], Error>) -> ()
typealias ResultCompletion = (Result<Data, Error>) -> ()

let baseURL = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
