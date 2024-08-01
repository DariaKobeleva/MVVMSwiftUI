//
//  CourseListView.swift
//  MVVMSwiftUI
//
//  Created by Дарья Кобелева on 31.07.2024.
//

import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel = CourseListViewModel()
    var body: some View {
        NavigationStack {
            List(viewModel.rows, id: \.courseName) { courseDetailsViewModel in
                NavigationLink(destination: CourseDetailsView(viewModel: courseDetailsViewModel)) {
                    RowView(viewModel: courseDetailsViewModel)
                }
            }
            .navigationTitle("Courses")
        }
        .task {
            await viewModel.fetchCourses()
        }
    }
}


#Preview {
    CourseListView()
}
