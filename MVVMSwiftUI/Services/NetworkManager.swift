//
//  NetworkManager.swift
//  MVVMSwiftUI
//
//  Created by Дарья Кобелева on 31.07.2024.
//

import Foundation

enum NetworkError: Error {
    case noData
    case invalidURL
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCourses() async throws -> [Course] {
        guard let url = URL(string: API.courseURL.rawValue) else {
            throw NetworkError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let courses = try? decoder.decode([Course].self, from: data) else {
            throw NetworkError.decodingError
        }
        return courses
    }
    
    func fetchImageData(from url: String) throws -> Data {
        guard let imageURL = URL(string: url) else { throw NetworkError.invalidURL}
        guard let imageData = try? Data(contentsOf: imageURL) else { throw NetworkError.noData }
        return imageData
    }
}

enum API: String {
    case courseURL = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
}
