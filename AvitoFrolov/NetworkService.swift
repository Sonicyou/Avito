//
//  NetworkService.swift
//  AvitoFrolov
//
//  Created by Артем Фролов on 30.08.2021.
//

import Foundation

class NetworkService {
    
    func getEmployeesList(completion: @escaping EmployeesListCompletion) {
        getRequest(URLString: baseURL) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(Employees.self, from: data)
                    completion(.success(jsonData.company.employees))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}
    
extension NetworkService {
    private func getRequest(URLString: String, completion: @escaping ResultCompletion) {
        guard let url = URL(string: URLString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
