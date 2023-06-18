//
//  FinalCollectionViewCell.swift
//  FinalExample
//
//  Created by 김동현 on 2023/06/16.
//

import UIKit

import SnapKit
import Then

class FinalCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCell"
    
    // MARK: - UI Components
    let imageView = UIImageView()
    
    // MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        backgroundColor = .white
    }
    func setLayout() {
        addSubview(imageView)
        imageView.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(90)
//            $0.leading.equalToSuperview().inset(20)
            $0.edges.equalToSuperview()     // 이부분 바꿔줬더니 됨...ㅎ
        }
    }
    func configureCell(_ image: UIImage) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
    }
}
