//
//  Course.swift
//  MVVMSwiftUI
//
//  Created by Дарья Кобелева on 31.07.2024.
//

import Foundation

struct Course: Decodable {
    let name: String
    let imageUrl: URL
    let numberOfLessons: Int
    let numberOfTests: Int
}


