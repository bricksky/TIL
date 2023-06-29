//
//  ViewController.swift
//  FloatingButton_Practice
//
//  Created by 김동현 on 2023/06/26.
//

import UIKit

import SnapKit


class FloatingViewController: UIViewController {
    
    // 클릭 이전 배경
    private let basicbackgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background")
        return imageView
    }()
    
    // 클릭 이후 배경
    lazy var clickedbackgroundView: UIView = {
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        view.isHidden = true
        self.view.insertSubview(view, belowSubview: self.floatingButton)
        return view
    }()
    
    // StackView를 통해 화면 UIButton 넣을 예정
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .fill
        view.distribution = .fillEqually
        view.isHidden = true
        return view
    }()
    
    // StackView에 들어갈 Button
    lazy var floatingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Plus"), for: .normal)
        button.addTarget(self, action: #selector(floatingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // StackView에 들어갈 Button
    lazy var wineButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Wine"), for: .normal)
        //        button.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        return button
    }()
    
    // StackView에 들어갈 Button
    lazy var coffeeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Coffee"), for: .normal)
        //        button.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        return button
    }()
    
    // StackView에 들어갈 Button
    lazy var cokeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Coke"), for: .normal)
        //        button.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    func setLayout() {
        view.addSubviews(basicbackgroundView, stackView, floatingButton)
        
        stackView.addArrangedSubview(wineButton)
        stackView.addArrangedSubview(coffeeButton)
        stackView.addArrangedSubview(cokeButton)
        
        basicbackgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        floatingButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(50)
            $0.bottom.equalToSuperview().inset(70)
            $0.width.height.equalTo(50)
        }
        stackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(50)
            $0.bottom.equalTo(floatingButton.snp.top).offset(-20)
            $0.width.equalTo(50)
            $0.height.equalTo(180)
        }
    }
    
    // clickedbackgroundView를 불러온 첫번째 방법
    //    @objc
    //    func floatingButtonTapped(){
    //        stackView.isHidden = !stackView.isHidden
    //        clickedbackgroundView.isHidden = !clickedbackgroundView.isHidden
    //        print("plus버튼 클릭!!!")
    //    }
    
    // clickedbackgroundView를 불러온 두번째 방법
    @objc
    func floatingButtonTapped(){
        stackView.isHidden = !stackView.isHidden
        clickedbackgroundView.isHidden = !clickedbackgroundView.isHidden
        
        print("plus버튼 클릭!!!")
        
        UIView.animate(withDuration: 0.5) {
            if self.clickedbackgroundView.isHidden {
                self.clickedbackgroundView.alpha = 0
            } else {
                self.clickedbackgroundView.alpha = 1
            }
        }
        
        let rotationAngle = CGFloat.pi / 2
        UIView.animate(withDuration: 0.3) {
//            self.floatingButton.transform = CGAffineTransform(rotationAngle: rotationAngle)
            self.floatingButton.transform = self.floatingButton.transform.rotated(by: rotationAngle)
        }
    }
}


