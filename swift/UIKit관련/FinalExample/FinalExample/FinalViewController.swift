//
//  ViewController.swift
//  FinalExample
//
//  Created by 김동현 on 2023/06/16.
//

//
//  ViewController.swift
//  FinalExample
//
//  Created by 김동현 on 2023/06/16.
//

import UIKit

import SnapKit
import Then

class FinalViewController: UIViewController {
    
    private var songDummyCase = SongImage.dummy() {
        didSet {
            self.songView.reloadData()
        }
    }
    
    private var BookDummyCase = BookImage.dummy() {
        didSet {
            self.bookView.reloadData()
        }
    }
    
    private var MovieDummyCase = MovieImage.dummy() {
        didSet {
            self.movieView.reloadData()
        }
    }
    
    // MARK: - UI Components
    private let songLabel = UILabel()
    private let bookLabel = UILabel()
    private let movieLabel = UILabel()
    private lazy var songView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private lazy var bookView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private lazy var movieView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        view.backgroundColor = .white
        songLabel.do {
            $0.text = "😀 제가 좋아하는 노래를 소개합니다"
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 16)
        }
        bookLabel.do {
            $0.text = "🍀 제가 좋아하는 책을 소개합니다"
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 16)
        }
        movieLabel.do {
            $0.text = "🚙 제가 좋아하는 영화를 소개합니다"
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 16)
        }
        songView.do {
            $0.backgroundColor = .white
            $0.register(FinalCollectionViewCell.self, forCellWithReuseIdentifier: FinalCollectionViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
        bookView.do {
            $0.backgroundColor = .white
            $0.register(FinalCollectionViewCell.self, forCellWithReuseIdentifier: FinalCollectionViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
        movieView.do {
            $0.backgroundColor = .white
            $0.register(FinalCollectionViewCell.self, forCellWithReuseIdentifier: FinalCollectionViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
    }

    func setLayout() {
        view.addSubviews(songLabel, bookLabel, movieLabel, songView, bookView, movieView)

        songLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(20)
        }
        songView.snp.makeConstraints{
            $0.top.equalTo(songLabel.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(180)
        }
        bookLabel.snp.makeConstraints{
            $0.top.equalTo(songView.snp.bottom).offset(40)
            $0.leading.equalTo(20)
        }
        bookView.snp.makeConstraints{
            $0.top.equalTo(bookLabel.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(180)
        }
        movieLabel.snp.makeConstraints{
            $0.top.equalTo(bookView.snp.bottom).offset(40)
            $0.leading.equalTo(20)
        }
        movieView.snp.makeConstraints{
            $0.top.equalTo(movieLabel.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(180)
        }
    }
}

extension FinalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 300 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - DataSource
extension FinalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FinalCollectionViewCell.identifier, for: indexPath) as? FinalCollectionViewCell else {
            print("으악")
            return UICollectionViewCell()
        }
        
        if collectionView == songView {
            cell.configureCell(songDummyCase[indexPath.item].image)
        } else if collectionView == bookView {
            cell.configureCell(BookDummyCase[indexPath.item].image)
        } else if collectionView == movieView {
            cell.configureCell(MovieDummyCase[indexPath.item].image)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == songView {
            return songDummyCase.count
        } else if collectionView == bookView {
            return BookDummyCase.count
        } else if collectionView == movieView {
            return MovieDummyCase.count
        }
        return 0
    }
}



    
