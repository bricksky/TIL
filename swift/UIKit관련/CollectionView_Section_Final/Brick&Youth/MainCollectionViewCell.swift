//
//  TableCollectionViewCell.swift
//  CollectionView_Section
//
//  Created by 김동현 on 2023/06/23.
//


import UIKit

import SnapKit
import Then

class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCell"
    
    var imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setStyle() {
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
    }
    
    func setLayout() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func configureCell(_ image: UIImage) {
        imageView.image = image
    }
}


