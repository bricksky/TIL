//
//  MyTableViewCell.swift
//  TableView_Pratice
//
//  Created by 김동현 on 2023/06/05.
//

import UIKit

import SnapKit
import Then

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    
    private let settingIcon = UILabel()
    private let settingLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setHierarchy()
        setLayout()

    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        settingIcon.do {
            $0.font = UIFont.systemFont(ofSize: 15)
        }
        
        settingLabel.do {
            $0.font = UIFont.systemFont(ofSize: 15)
            $0.textColor = .white
        }
        backgroundColor = .darkGray
    }
    func setLayout() {
        settingIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(15)
        }
        settingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(settingIcon.snp.trailing).offset(20)
        }
    }
    
    func setHierarchy() {
        contentView.addSubviews(settingIcon,settingLabel)
    }
    
    func configureCell(_ setting: Setting) {
        settingIcon.text = setting.settingIcon
        settingLabel.text = setting.settingLabel
    }
}
