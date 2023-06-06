//
//  MyTableViewController.swift
//  TableView_Pratice
//
//  Created by 김동현 on 2023/06/05.
//

import UIKit

class MyTableViewController: UIViewController, UITableViewDelegate {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let dummy = Setting.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        
        view.backgroundColor = .black
        
        self.navigationController?.navigationBar.isHidden = true
        
        tableView.do {
            $0.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
            $0.rowHeight = 40
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black
        }
    }
    
    func setLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.contentView.backgroundColor = UIColor.systemTeal
        cell.textLabel?.textColor = UIColor.black
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
          guard let cell = tableView.cellForRow(at: indexPath) else { return }
          cell.contentView.backgroundColor = UIColor.darkGray
          cell.textLabel?.textColor = UIColor.white
      }
    
}

// MARK: UITableViewDataSource를 체택하면 필요한 메서드
extension MyTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        cell.configureCell(dummy[indexPath.section][indexPath.row])
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dummy[section].count
        case 1:
            return dummy[section].count
        default:
            return 0
        }
    }
}

