//
//  UIView+.swift
//  Practice_Lion
//
//  Created by 김동현 on 2023/06/19.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
