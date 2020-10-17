//
//  FaceTextField.swift
//  Stars Face
//
//  Created by samer on 9/30/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class FaceTextField: UITextField {

    init(placeholder: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        backgroundColor = .black
        textColor = FaceColors.neonBlue
        textAlignment = .center
        layer.cornerRadius = 25
        layer.borderColor = FaceColors.nicePink?.cgColor
        layer.borderWidth = 1
        autocorrectionType = .no
        autocapitalizationType = .none
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
