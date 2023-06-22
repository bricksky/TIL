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
    
    static let identifier = "MainTableViewCell"
    
    private let titleMessage = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        
        titleMessage.do {
            $0.font = UIFont.systemFont(ofSize: 15)
            $0.textColor = .black
        }
        backgroundColor = .white
    }
    
//    func configureCell(_ setting: Setting) {
//        settingIcon.text = setting.settingIcon
//        settingLabel.text = setting.settingLabel
//    }
}

