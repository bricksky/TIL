//
//  SearchCollectionViewCell.swift
//  Practice_Lion
//
//  Created by 김동현 on 2023/07/08.
//  Copyright (c) 2023 Search. All rights reserved.
//

import UIKit

import SnapKit

final class SearchCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCell"
    
    lazy var categoryImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleToFill
//        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 10
        return imageview
    }()
    
    lazy var categoryInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor =  .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
        // MARK: - button의 addtarget설정
        setAddTarget()
        
        // MARK: - delegate설정
        setDelegate()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(_ image: CatrgoryImage) {
        categoryImageView.image = image.image
        categoryInfoLabel.text = image.infoDdescription
    }
}

private extension SearchCollectionViewCell {
    func setUI() {
        layer.masksToBounds = true
    }
    
    func setHierarchy() {
        contentView.addSubview(categoryImageView)
        categoryImageView.addSubview(categoryInfoLabel)
    }
    
    func setLayout() {
        categoryImageView.snp.makeConstraints {make in
            make.top.horizontalEdges.equalToSuperview()
            make.width.equalTo(162)
            make.height.equalTo(112)
        }
        categoryInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryImageView).inset(84)
            make.leading.equalTo(categoryImageView).inset(8.2)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}

