//
//  ViewController.swift
//  Brick&Youth
//
//  Created by 김동현 on 2023/06/21.
//

import UIKit

import SnapKit
import Then

class MainViewController: UIViewController {
    
    private let tableView = UITableView()
    private var dummy = DataConcludeCellSize.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        view.backgroundColor = .black
        
        tableView.do {
            $0.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
            $0.backgroundColor = .black
            $0.dataSource = self
            $0.delegate = self
        }
    }
    
    func setLayout() {
        view.addSubviews(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dummy.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.section {
//        case 0:
//            return 100
//        case 1:
//            return 200
//        case 2:
//            return 300
//        default:
//            return 0
//        }
        return dummy[indexPath.section].cellSize.height
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    { return 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(dummy[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "LionHeart의 아기사자"
        case 1:
            return "GO_SOPT의 프로젝트"
        case 2:
            return "GO_SOPT의 스터디"
        default : return "happy"
        }
    }
}



