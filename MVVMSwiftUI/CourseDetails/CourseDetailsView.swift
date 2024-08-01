//
//  CourseDetailsView.swift
//  MVVMSwiftUI
//
//  Created by Дарья Кобелева on 01.08.2024.
//

import SwiftUI

struct CourseDetailsView: View {
   @StateObject var viewModel: CourseDetailsViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.courseName)
                .font(.largeTitle)
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    CourseImage(
                        imageData: viewModel.imageData,
                        imageSize: CGSize(width: 280, height: 210),
                        cornerRadius: 30,
                        shadowIsOn: true
                    )
                    FavoriteStatusButton(isFavorite: viewModel.isFavorite) {
                        viewModel.favoriteButtonPressed()
                    }
                    .offset(x: 110, y: 70)
                }
                Text(viewModel.numberOfLessons)
                    .font(.headline)
                Text(viewModel.numberOfTests)
                    .font(.headline)
            }
            Spacer()
        }
    }
}

struct FavoriteStatusButton: View {
    var isFavorite: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(isFavorite ? .red : .gray)
        }
    }
}

#Preview {
    CourseDetailsView(viewModel: CourseDetailsViewModel(course: Course.getCourse()))
}
