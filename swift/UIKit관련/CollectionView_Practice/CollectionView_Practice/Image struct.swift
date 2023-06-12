//
//  Image struct.swift
//  CollectionView_Practice
//
//  Created by 김동현 on 2023/06/10.


import UIKit

import SnapKit
import Then

struct Image {
    let image: UIImage
}

extension Image {
    static func dummy() -> [Image] {
        var images: [Image] = []
        for number in 1...20 {
            images.append(Image(image: UIImage(named: "Image_\(number)") ?? UIImage()))
        }
        return images
    }
}
