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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        view.backgroundColor = .blue
        
        tableView.do {
            $0.backgroundColor = .green
        }
    }
    func setLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}


/*
extension MyTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        cell.configureCell(dummy[indexPath.section][indexPath.row])
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
 
 
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentTableViewCell.cellID, for: indexPath) as? ContentTableViewCell else { return ContentTableViewCell() }
     cell.data = testData[indexPath.section]
     cell.selectionStyle = .none
     return cell
 }
 
*/


extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    { return 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        cell.
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
