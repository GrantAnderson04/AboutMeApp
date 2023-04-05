//
//  Extensions.swift
//  AboutMe
//
//  Created by Grant Anderson on 3/31/23.
//

import Foundation
import UIKit

class labelInButton {
    
}


extension UIButton {
    func labelInMiddle(nameOfLabel: String, labelColor: UIColor) {
    let label = UILabel()
        label.text = nameOfLabel
        label.textColor = labelColor
        label.font = UIFont(name: "DIN Alternate", size: 32)
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
    }
}


extension UIButton {
    func imageInButton(nameOfImage: String) {
        self.setImage(UIImage(named: nameOfImage), for: .normal)
        self.imageView?.layer.cornerRadius = 20
    }
}


extension UIButton {
    func colorButton(Color: UIColor) {
//        let label = UILabel()
//        label.text = colorTitle
//        self.addSubview(label)
        self.backgroundColor = Color
    }
}
