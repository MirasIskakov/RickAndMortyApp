//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 31.01.2024.
//

import UIKit

extension UIView {
    func addSubview(_ views: UIView...) {
        views.forEach({
           addSubview($0)
        })
    }
}
