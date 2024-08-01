//
//  CourseImage.swift
//  MVVMSwiftUI
//
//  Created by Дарья Кобелева on 01.08.2024.
//

import SwiftUI

struct CourseImage: View {
    let imageData: Data
    let imageSize: CGSize
    let cornerRadius: CGFloat
    let shadowIsOn: Bool
    
    var body: some View {
        getImage(from: imageData)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowIsOn ? 10 : 0)
    }
    
    private func getImage(from data: Data) -> Image {
        guard let image = UIImage(data: data) else {
            return  Image(systemName: "xmark.shield")
        }
        return Image(uiImage: image)
    }
}

#Preview {
    CourseImage(
        imageData: Data(),
        imageSize: CGSize(width: 230, height: 180),
        cornerRadius: 30,
        shadowIsOn: true
    )
}
