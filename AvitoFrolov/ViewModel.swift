//
//  ViewModel.swift
//  AvitoFrolov
//
//  Created by Артем Фролов on 30.08.2021.
//

import Foundation
import UIKit

class ViewModel {
    
    var completionEmployeesList: EmployeesList?
    var items: [Person]?
    let router = EmployeesRouter()
    private let userDefaultsService = UserDefaultsService(defaults: UserDefaults.standard)
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchPeople() {
        do {
            items = try context.fetch(Person.fetchRequest())
        } catch {
            print("not fetched people")
        }
        completionEmployeesList?(items ?? [])
    }
    
    func getEmployeesList() {
        guard let lastDate = userDefaultsService.get(key: .savingTime) else {
            sendRequest()
            return
        }
        if (Date().timeIntervalSince1970 - lastDate.timeIntervalSince1970)/3600 > 1 {
            sendRequest()
        } else {
            fetchPeople()
        }
    }
    
    func sendRequest() {
        NetworkService().getEmployeesList { [weak self] result in
            switch result {
            case .success(let employeesList):
                self?.cleanCoreData()
                let employeesList = employeesList.sorted { $0.name < $1.name }
                self?.savePersons(employeesList: employeesList)
                self?.userDefaultsService.set(key: .savingTime, value: Date())
                self?.fetchPeople()
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.router.showError(error, completion: {
                        self?.getEmployeesList()
                    })
                }
            }
        }
    }
    
    private func cleanCoreData() {
        do {
            items = try context.fetch(Person.fetchRequest())
        } catch {
            print("not fetched people")
        }
        
        items?.forEach {
            context.delete($0)
        }
        do {
            try context.save()
        } catch {
           print ("data not saved")
        }
    }
    
    private func savePersons(employeesList: [Employee]) {
        employeesList.forEach {
            let newPerson = Person(context: context)
            newPerson.name = $0.name
            newPerson.phoneNumber = $0.phone_number
            newPerson.skills = $0.skills
            do {
                try context.save()
            } catch {
                print ("data not saved")
            }
        }
    }
}
