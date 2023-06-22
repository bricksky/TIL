//
//  ImageStruct.swift
//  Brick&Youth
//
//  Created by 김동현 on 2023/06/22.
//

import UIKit

import SnapKit
import Then

struct SampleImage {
    let image: UIImage
}

extension SampleImage {
    static func dummy() -> [[SampleImage]] {
        
        return [[SampleImage(image: UIImage(named: "Person_1")!),
                 SampleImage(image: UIImage(named: "Person_2")!),
                 SampleImage(image: UIImage(named: "Person_3")!),
                 SampleImage(image: UIImage(named: "Person_4")!),
                 SampleImage(image: UIImage(named: "Person_5")!),
                 SampleImage(image: UIImage(named: "Person_6")!)],
                
                [SampleImage(image: UIImage(named: "Project_1")!),
                 SampleImage(image: UIImage(named: "Project_2")!),
                 SampleImage(image: UIImage(named: "Project_3")!),
                 SampleImage(image: UIImage(named: "Project_4")!),
                 SampleImage(image: UIImage(named: "Project_5")!),
                 SampleImage(image: UIImage(named: "Project_6")!)],
                
                [SampleImage(image: UIImage(named: "Study_1")!),
                 SampleImage(image: UIImage(named: "Study_2")!),
                 SampleImage(image: UIImage(named: "Study_3")!),
                 SampleImage(image: UIImage(named: "Study_4")!),
                 SampleImage(image: UIImage(named: "Study_5")!),
                 SampleImage(image: UIImage(named: "Study_6")!)]]
    }
}
