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
            ScrollView {
                ForEach(viewModel.courses, id: \.name) { course in
                    Text(course.name)
                }
            }
            .navigationTitle("Courses")
            .navigationBarItems(trailing: Button("Fetch Data") {
                Task {
                    await viewModel.fetchDataPressed()
                }
            })
        }
    }
}


#Preview {
    CourseListView()
}
