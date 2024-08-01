//
//  DataManager.swift
//  MVVMSwiftUI
//
//  Created by Дарья Кобелева on 01.08.2024.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func setFavoriteStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }
    
    func saveFavoriteStatus(for courseName: String, with status: Bool) {
        UserDefaults.standard.set(status, forKey: courseName)
    }
    
    func getFavoriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
    
    func loadFavoriteStatus(for courseName: String) -> Bool {
        UserDefaults.standard.bool(forKey: courseName)
    }
}
