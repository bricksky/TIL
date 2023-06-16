//
//  ImageCollectionViewCell.swift
//  CollectionView_Practice2
//
//  Created by 김동현 on 2023/06/12.
//

import UIKit

import SnapKit
import Then

final class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCell"

    let imageView = UIImageView()

override init(frame: CGRect) {
    super.init(frame: frame)
    setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    func configureCell(_ image: PracticeImage) {
        imageView.image = image.image
    }
    func changeImage() {
        imageView.image = UIImage(named: "question")
    }
    func restoreImage() {
        imageView.image = UIImage(named: "sky")
    }
}
