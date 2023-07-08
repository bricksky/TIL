//
//  CategoryImageStruct.swift
//  Practice_Lion
//
//  Created by 김동현 on 2023/07/08.
//

import UIKit

struct CatrgoryImage {
    let image: UIImage
    let infoDdescription: String
}

extension CatrgoryImage {
    static func dummy() -> [CatrgoryImage] {
        var images: [CatrgoryImage] = []
        let descriptions = ["예산", "신체 변화", "부부 관계", "병원 진료", "지원 제도", "태교", "아기 용품", "출산 직전"]
        
        for number in 1...8 {
            images.append(CatrgoryImage(image: UIImage(named: "Category_\(number)") ?? UIImage(), infoDdescription: descriptions[number - 1]))
        }
        return images
    }
}


/*
 기존 코드
 import UIKit

 import SnapKit
 import Then

 struct CatrgoryImage {
     let image: UIImage
 }

 extension CatrgoryImage {
     static func dummy() -> [CatrgoryImage] {
         var images: [CatrgoryImage] = []
         for number in 1...8 {
             images.append(CatrgoryImage(image: UIImage(named: "Category_\(number)") ?? UIImage()))
         }
         return images
     }
 }*/



