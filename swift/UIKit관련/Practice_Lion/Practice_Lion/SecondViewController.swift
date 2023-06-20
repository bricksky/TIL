//
//  SecondViewController.swift
//  Practice_Lion
//
//  Created by 김동현 on 2023/06/19.
//

import UIKit

import SnapKit
import Then
import Then

class SecondViewController: UIViewController, UITextViewDelegate {
    
    private let firstTitle = UILabel()
    private let firstTextfield = UITextView()
    private let secondTitle = UILabel()
    private let secondTextfield = UITextView()
    private let thirdTitle = UILabel()
    private let thirdTextfield = UITextView()
    private let fourthTitle = UILabel()
    private let fourthTextfield = UITextView()
    private let detailTitle = UILabel()
    private let detailContent = UILabel()
    private let subscribeButton = UIButton()
    
    private let firstTextViewPlaceHolder = "  안녕하세요! iOS YB 김동현입니다."
    private let secondTextViewPlaceHolder = "  10,000원 입니다."
    private let thirdTextViewPlaceHolder = "  일시불로 진행해주세요."
    private let fourthTextViewPlaceHolder = "  동의합니다"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextfield.delegate = self
        secondTextfield.delegate = self
        thirdTextfield.delegate = self
        fourthTextfield.delegate = self
        
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        view.backgroundColor = .white
        firstTitle.do {
            $0.text = "구독 정보"
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 18)
        }
        firstTextfield.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 15)
            $0.backgroundColor = .systemGray5
            $0.layer.cornerRadius = 10
            $0.text = firstTextViewPlaceHolder
        }
        secondTitle.do {
            $0.text = "결재 금액"
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 18)
        }
        secondTextfield.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 15)
            $0.backgroundColor = .systemGray5
            $0.layer.cornerRadius = 10
            $0.text = secondTextViewPlaceHolder
        }
        thirdTitle.do {
            $0.text = "결재 수단"
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 18)
        }
        thirdTextfield.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 15)
            $0.backgroundColor = .systemGray5
            $0.layer.cornerRadius = 10
            $0.text = thirdTextViewPlaceHolder
        }
        fourthTitle.do {
            $0.text = "약관 동의"
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 18)
        }
        fourthTextfield.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 15)
            $0.backgroundColor = .systemGray5
            $0.layer.cornerRadius = 10
            $0.text = fourthTextViewPlaceHolder
        }
        detailTitle.do {
            $0.textColor = .darkGray
            $0.font = .boldSystemFont(ofSize: 10)
        }
        detailContent.do {
            $0.textColor = .darkGray
            $0.font = .boldSystemFont(ofSize: 10)
        }
        subscribeButton.do {
            $0.setTitle("정기구독 시작하기", for: .normal)
            $0.backgroundColor = UIColor.systemOrange
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            $0.setTitleColor(UIColor.black, for: .normal)
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: #selector(subscribeButtonTapped), for: .touchUpInside)
        }
        
    }
    func setLayout() {
        view.addSubviews(firstTitle, firstTextfield, secondTitle, secondTextfield, thirdTitle, thirdTextfield, fourthTitle, fourthTextfield, detailTitle, detailContent, subscribeButton)
        
        firstTitle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(20)
        }
        firstTextfield.snp.makeConstraints{
            $0.top.equalTo(firstTitle.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(353)
            $0.height.equalTo(100)
        }
        secondTitle.snp.makeConstraints{
            $0.top.equalTo(firstTextfield.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        secondTextfield.snp.makeConstraints{
            $0.top.equalTo(secondTitle.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(353)
            $0.height.equalTo(80)
        }
        thirdTitle.snp.makeConstraints{
            $0.top.equalTo(secondTextfield.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        thirdTextfield.snp.makeConstraints{
            $0.top.equalTo(thirdTitle.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(353)
            $0.height.equalTo(100)
        }
        fourthTitle.snp.makeConstraints{
            $0.top.equalTo(thirdTextfield.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        fourthTextfield.snp.makeConstraints{
            $0.top.equalTo(fourthTitle.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(353)
            $0.height.equalTo(100)
        }
        detailTitle.snp.makeConstraints{
            $0.top.equalTo(fourthTextfield.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        detailContent.snp.makeConstraints{
            $0.top.equalTo(detailTitle.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
        subscribeButton.snp.makeConstraints{
            $0.top.equalTo(detailContent.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(40)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == firstTextfield && textView.text == firstTextViewPlaceHolder {
                    textView.text = ""
                } else if textView == secondTextfield && textView.text == secondTextViewPlaceHolder {
                    textView.text = ""
                } else if textView == thirdTextfield && textView.text == thirdTextViewPlaceHolder {
                    textView.text = ""
                } else if textView == fourthTextfield && textView.text == fourthTextViewPlaceHolder {
                    textView.text = ""
                }
    }
    
    func presentToFirstViewController() {
       let firstViewController = FirstViewController()
        firstViewController.modalPresentationStyle = .fullScreen
        self.dismiss(animated: true)
    }
    
    @objc
    func subscribeButtonTapped() {
        presentToFirstViewController()
    }
}
