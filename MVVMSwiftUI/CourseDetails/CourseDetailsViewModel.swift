//
//  CourseDetailsViewModel.swift
//  MVVMSwiftUI
//
//  Created by Дарья Кобелева on 01.08.2024.
//

import Foundation

class CourseDetailsViewModel: ObservableObject {
    var courseName: String {
        course.name
    }
    
    var imageData: Data {
        var imageData = Data()
        do {
            imageData = try NetworkManager.shared.fetchImageData(from: course.imageUrl)
        } catch {
            print(error)
        }
        
        return imageData
    }
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons)"
    }
    
    var numberOfTests: String {
        "Number of tests: \(course.numberOfTests)"
    }
    
    @Published var isFavorite: Bool {
        didSet {
            DataManager.shared.saveFavoriteStatus(for: course.name, with: isFavorite)
        }
    }
    
    private let course: Course
    
    init(course: Course) {
        self.course = course
        isFavorite = DataManager.shared.loadFavoriteStatus(for: course.name)
    }
    
    func favoriteButtonPressed() {
        isFavorite.toggle()
    }
}
