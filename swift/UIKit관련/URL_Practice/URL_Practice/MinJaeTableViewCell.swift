//
//  TableViewCell.swift
//  URL_Practice
//
//  Created by 김동현 on 2023/07/04.
//

import UIKit

import SnapKit

class TableViewCell: UITableViewCell {
    
    
    static let identifier = "UITableViewCell"
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
    private let flowlayout = UICollectionViewFlowLayout()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: nil)
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension TableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return .init()
    }
}
