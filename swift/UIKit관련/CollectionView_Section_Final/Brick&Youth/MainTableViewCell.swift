//
//  MainTableViewCell.swift
//  Brick&Youth
//
//  Created by 김동현 on 2023/06/21.
//

import UIKit

import SnapKit
import Then

class MainTableViewCell: UITableViewCell {
    
    //    // MARK: - TableViewCell에 CollectionView를 넣을 때에는 그냥 TableViewCell에 View를 얹는다는 느낌으로 생각하면 됨.
    
    
    //    // MARK: - CollectionView를 넣을 때에는 반드시 FlowLayout 설정를 잡아주어야 함.
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
    static let identifier = "MainTableViewCell"
    private var cellSize: CGSize = .init(width: 100, height: 100) {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private var imageList = [SampleImage]() {   // 한 section에 해당하는 []
        
    //    // MARK: -     datas의 속성이 변하는지 감시하는 역할. datas가 바뀌면, 컬렉션 뷰를 다시 그림.
    //    // MARK: -     configureCell을 통해 값을 받아온 이후에 View를 다시 그려야하는 상황인 것!
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let titleMessage = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        flowLayout.scrollDirection = .horizontal
        contentView.addSubview(collectionView)
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        setStyle()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        
        titleMessage.do {
            $0.font = UIFont.systemFont(ofSize: 15)
            $0.textColor = .white
        }
    }
    
    //    // MARK: - ViewdidLoad 이후에 실행되는 함수
        func configureCell(_ imageStruct: DataConcludeCellSize) {
            print(imageStruct)
            imageList = imageStruct.datas
            cellSize = imageStruct.cellSize
        }
}


extension MainTableViewCell:
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
}

extension MainTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
                collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else {
            print("으악")
            return UICollectionViewCell()
        }
        cell.configureCell(imageList[indexPath.row].imageView)
        return cell
    }
}
