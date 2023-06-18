//
//  Image_Struct.swift
//  FinalExample
//
//  Created by 김동현 on 2023/06/16.
//

import UIKit

import SnapKit
import Then

struct SongImage {
    let image: UIImage
}

extension SongImage {
    static func dummy() -> [SongImage] {
        var images: [SongImage] = []
        for number in 1...6 {
            images.append(SongImage(image: UIImage(named: "Song\(number)") ?? UIImage()))
        }
        return images
    }
}

struct BookImage {
    let image: UIImage
}

extension BookImage {
    static func dummy() -> [BookImage] {
        var images: [BookImage] = []
        for number in 1...6 {
            images.append(BookImage(image: UIImage(named: "Book\(number)") ?? UIImage()))
        }
        return images
    }
}

struct MovieImage {
    let image: UIImage
}

extension MovieImage {
    static func dummy() -> [MovieImage] {
        var images: [MovieImage] = []
        for number in 1...6 {
            images.append(MovieImage(image: UIImage(named: "Movie\(number)") ?? UIImage()))
        }
        return images
    }
}


