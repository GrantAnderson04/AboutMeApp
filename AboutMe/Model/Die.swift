//
//  Model.swift
//  AboutMe
//
//  Created by Grant Anderson on 4/5/23.
//

import Foundation
import UIKit

class Die {
    
    init(numberOfSides: Int) {
        self.value = 1
        self.numberOfSides = numberOfSides
    }
    
    var value: Int
    let numberOfSides: Int
    
    func rollDie() {
        value = Int.random(in: 1...numberOfSides)
    }
    
}

