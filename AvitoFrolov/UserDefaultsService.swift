//
//  UserDefaultsService.swift
//  AvitoFrolov
//
//  Created by Артем Фролов on 07.09.2021.
//

import Foundation

class UserDefaultsService {
   
    private var defaults: UserDefaults
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
    
    func get<T>(key: DefaultsKey<T>) -> T? {
        defaults.object(forKey: key.value) as? T
    }
    
    func set<T>(key: DefaultsKey<T>, value: T?) {
        defaults.set(value, forKey: key.value)
    }
}

class DefaultsKeys {
    static let savingTime = DefaultsKey<Date>(value: "savingTime")
}

class DefaultsKey<T>: DefaultsKeys {
    
    let value: String
    
    init(value: String) {
        self.value = value
    }
}

