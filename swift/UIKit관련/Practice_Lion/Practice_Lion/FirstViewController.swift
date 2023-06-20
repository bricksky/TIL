//
//  ViewController.swift
//  Practice_Lion
//
//  Created by 김동현 on 2023/06/19.
//

import UIKit

import SnapKit
import Then

class FirstViewController: UIViewController {

    private let mainLabel = UILabel()
    private let lionImage = UIImageView()
    private let startLabel = UILabel()
    private let endLabel = UILabel()
    private let priceLabel = UILabel()
    private let priceEndLabel = UILabel()
    private let goButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    func setStyle() {
        view.backgroundColor = .white
        mainLabel.do {
            $0.text = "LION \nHEART"
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 30)
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
        lionImage.do {
            $0.image = UIImage(named: "Lion")
        }
        startLabel.do {
            $0.text = "첫 달 무료로 시작하기"
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 30)
        }
        endLabel.do {
            $0.text = "결제일 전엔 언제든 해지 가능해요"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 15)
        }
        priceLabel.do {
            $0.text = "월 9,900원"
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 30)
        }
        priceEndLabel.do {
            $0.text = "(*첫 결제일 전에는 요금이 청구되지 않습니다)"
            $0.textColor = .darkGray
            $0.font = .systemFont(ofSize: 15)
        }
        goButton.do {
            $0.setTitle("더 좋은 부모 되기", for: .normal)
            $0.backgroundColor = UIColor.systemOrange
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            $0.setTitleColor(UIColor.black, for: .normal)
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: #selector(goButtonTapped), for: .touchUpInside)
        }
    }
    
    func setLayout() {
        view.addSubviews(mainLabel, lionImage, startLabel, endLabel, priceLabel, priceEndLabel, goButton)
        
        mainLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
        lionImage.snp.makeConstraints{
            $0.top.equalTo(mainLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(350)
        }
        startLabel.snp.makeConstraints{
            $0.top.equalTo(lionImage.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        endLabel.snp.makeConstraints{
            $0.top.equalTo(startLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(endLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        priceEndLabel.snp.makeConstraints{
            $0.top.equalTo(priceLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        goButton.snp.makeConstraints{
            $0.top.equalTo(priceEndLabel.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(40)
        }
    }
    
    func presentToSecondViewController() {
       let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .automatic
        self.present(secondViewController, animated: true)
    }

    @objc
    func goButtonTapped() {
        presentToSecondViewController()
    }
}
