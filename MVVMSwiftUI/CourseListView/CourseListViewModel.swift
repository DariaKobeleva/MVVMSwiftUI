//
//  CourseListViewModel.swift
//  MVVMSwiftUI
//
//  Created by Дарья Кобелева on 31.07.2024.
//

import SwiftUI

class CourseListViewModel: ObservableObject {
    @Published var rows: [CourseDetailsViewModel] = []
    
    func fetchCourses() async {
        do {
            let courses = try await NetworkManager.shared.fetchCourses()
            rows = courses.map { CourseDetailsViewModel(course: $0)}
        } catch {
            print(error)
        }
    }
}
