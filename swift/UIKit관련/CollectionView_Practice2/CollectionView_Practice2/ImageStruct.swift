//
//  ㄷ.swift
//  CollectionView_Practice2
//
//  Created by 김동현 on 2023/06/12.
//


import UIKit

import SnapKit
import Then

struct PracticeImage {
    let image: UIImage
}

extension PracticeImage {
    static func dummy() -> [PracticeImage] {
        var images: [PracticeImage] = []
        for number in 1...18 {
            images.append(PracticeImage(image: UIImage(named: "Image\(number)") ?? UIImage()))
        }
        return images
    }
}



