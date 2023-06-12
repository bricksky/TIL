//
//  MyCollectionViewCell.swift
//  CollectionView_Practice
//
//  Created by 김동현 on 2023/06/11.
//

import UIKit

import SnapKit
import Then

final class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCell"
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setStyle() {
//        self.imageView.backgroundColor = .purple
//    }
    func setLayout() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    func configureCell(_ image: Image) {
        print(#function)
        imageView.image = image.image
    }
}
