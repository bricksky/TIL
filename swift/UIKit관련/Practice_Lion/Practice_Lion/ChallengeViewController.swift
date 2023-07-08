//
//  ChallengeVCViewController.swift
//  Practice_Lion
//
//  Created by 김동현 on 2023/07/07.
//  Copyright (c) 2023 ChallengeVC. All rights reserved.
//

import UIKit

import SnapKit

final class ChallengeViewController: UIViewController {
    
    lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "사랑이 아빠님"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .systemGray
        return label
    }()
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "6일째 도전중"
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    lazy var lionImage: UIImageView = {
        let lionImage = UIImageView()
        lionImage.image = UIImage(named: "lionImage")
        return lionImage
    }()

    lazy var levelLabel: UILabel = {
        let label = UILabel()
        label.text = "Lv. 1"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var lionLabel: UILabel = {
        let label = UILabel()
        label.text = "아기 사자"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var lionLabelBehindImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lionNicknameImage")
        return image
    }()

    lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.progressViewStyle = .default
        view.progressTintColor = UIColor(red: 0.667, green: 0, blue: 0.176, alpha: 1)
        view.trackTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.setProgress(0.75, animated: true)
        return view
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

private extension ChallengeViewController {
    func setUI() {
        view.backgroundColor = UIColor(red: 0.08, green: 0.08, blue: 0.09, alpha: 1)
    }
    
    func setHierarchy() {
        view.addSubviews(nicknameLabel, dayLabel, lionImage,lionLabelBehindImage, levelLabel, lionLabel, progressView)
    }
    
    func setLayout() {
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().inset(20)
        }
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().inset(20)
        }
        
        lionImage.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(29)
            make.centerX.equalToSuperview()
            make.width.equalTo(202)
            make.height.equalTo(202)
        }
     
        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(186)
            make.centerX.equalToSuperview()
        }
        
        lionLabel.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(203)
            make.centerX.equalToSuperview()
        }
        
        lionLabelBehindImage.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(209)
            make.centerX.equalToSuperview()
            make.width.equalTo(102)
            make.height.equalTo(20)
        }
        
        progressView.snp.makeConstraints { make in
            make.top.equalTo(lionImage.snp.bottom).offset(26)
            make.centerX.equalToSuperview()
            make.width.equalTo(217)
            make.height.equalTo(20)
        }
        
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
