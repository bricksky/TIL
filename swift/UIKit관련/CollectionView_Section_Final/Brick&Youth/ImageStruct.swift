//
//  ImageStruct.swift
//  Brick&Youth
//
//  Created by 김동현 on 2023/06/22.
//

import UIKit

import SnapKit
import Then

// MARK: - 이미지의 사이즈와 이미지 자체를 불러오기 위해 만든 하나의 구조체
struct DataConcludeCellSize {
    let cellSize: CGSize
    let datas: [SampleImage]
}

struct SampleImage {
    let imageView: UIImage
}

extension DataConcludeCellSize {
    static func dummy() -> [DataConcludeCellSize] {
        return [
            .init(cellSize: .init(width: 150, height: 220), datas: [SampleImage(imageView: UIImage(named: "Person_1")!),
                                                                    SampleImage(imageView: UIImage(named: "Person_2")!),
                                                                    SampleImage(imageView: UIImage(named: "Person_3")!),
                                                                    SampleImage(imageView: UIImage(named: "Person_4")!),
                                                                    SampleImage(imageView: UIImage(named: "Person_5")!)]),
            .init(cellSize: .init(width: 200, height: 145), datas: [SampleImage(imageView: UIImage(named: "Project_1")!),
                                                                    SampleImage(imageView: UIImage(named: "Project_2")!),
                                                                    SampleImage(imageView: UIImage(named: "Project_3")!),
                                                                    SampleImage(imageView: UIImage(named: "Project_4")!),
                                                                    SampleImage(imageView: UIImage(named: "Project_5")!)]),
            .init(cellSize: .init(width: 150 , height: 180), datas:  [SampleImage(imageView: UIImage(named: "Study_1")!),
                                                                     SampleImage(imageView: UIImage(named: "Study_2")!),
                                                                     SampleImage(imageView: UIImage(named: "Study_3")!),
                                                                     SampleImage(imageView: UIImage(named: "Study_4")!),
                                                                     SampleImage(imageView: UIImage(named: "Study_5")!),
                                                                     SampleImage(imageView: UIImage(named: "Study_6")!)])
            ]
    }
}
