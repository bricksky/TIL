//
//  UIView+.swift
//  FinalExample
//
//  Created by 김동현 on 2023/06/16.
//


import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
