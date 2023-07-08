//
//  SearchViewController.swift
//  Practice_Lion
//
//  Created by 김동현 on 2023/07/08.
//  Copyright (c) 2023 Search. All rights reserved.
//

import UIKit

import SnapKit

final class SearchViewController: UIViewController, UICollectionViewDelegate {
    
    private var dummyCase = CatrgoryImage.dummy() {
        didSet {
            self.categoryArticleCollectionView.reloadData()
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "어제보다 오늘,\n더 좋은 아빠가 되어볼까요?"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "똑똑한 아빠들의 비밀 습관"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        return label
    }()
    
    lazy var categoryArticleCollectionLabel: UILabel = {
        let label = UILabel()
        label.text = "카테고리별 아티클 모아보기"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    lazy var categoryArticleScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(red: 0.084, green: 0.084, blue: 0.092, alpha: 1)
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.084, green: 0.084, blue: 0.092, alpha: 1)
        return view
    }()
    
    lazy var categoryArticleCollectionView: UICollectionView = {
        let layout = flowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout())
        collectionView.backgroundColor = UIColor(red: 0.084, green: 0.084, blue: 0.092, alpha: 1)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
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
}

private extension SearchViewController {
    func setUI() {
        view.backgroundColor = UIColor(red: 0.084, green: 0.084, blue: 0.092, alpha: 1)
        categoryArticleCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        categoryArticleCollectionView.delegate = self
        categoryArticleCollectionView.dataSource = self
    }
    
    func setHierarchy() {
        view.addSubviews(titleLabel, subtitleLabel, categoryArticleCollectionLabel, categoryArticleScrollView)
        categoryArticleScrollView.addSubview(contentView)
        contentView.addSubview(categoryArticleCollectionView)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().inset(20)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(20)
        }
        categoryArticleCollectionLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(20)
        }
        categoryArticleScrollView.snp.makeConstraints { make in
            make.top.equalTo(categoryArticleCollectionLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(categoryArticleScrollView)
            make.width.equalTo(categoryArticleScrollView)
        }
        categoryArticleCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(categoryArticleScrollView)
            make.height.equalTo(478)
        }
    }
    
    private func flowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 162, height: 112)
        flowLayout.minimumInteritemSpacing = 11
        return flowLayout
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyCase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else {
            print("으악")
            return UICollectionViewCell()
        }
        cell.configureCell(dummyCase[indexPath.item])
        return cell
    }
}
