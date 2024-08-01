//
//  CourseListViewModel.swift
//  MVVMSwiftUI
//
//  Created by Дарья Кобелева on 31.07.2024.
//

import SwiftUI

class CourseListViewModel: ObservableObject {
    @Published var courses: [Course] = []
    
    func fetchDataPressed() async {
        do {
            self.courses = try await NetworkManager.shared.fetchCourses()
        } catch {
            print(error)
        }
    }
}
