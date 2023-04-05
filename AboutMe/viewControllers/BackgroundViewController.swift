//
//  BackgroundViewController.swift
//  AboutMe
//
//  Created by Grant Anderson on 4/1/23.
//
import Foundation
import UIKit

class BackgroundViewController: UIViewController {
    
    var profileViewController: UIViewController? = nil
    
    override func viewDidLoad() {
        profileViewController = storyboard?.instantiateViewController(withIdentifier: "profileController")
//            let blackButton = UIButton()
            let greenButton = UIButton()
//            let blueButton = UIButton()
//            let yellowButton = UIButton()

        
        
            buttonSize(greenButton, color: .green)
        
        
        
    }
    
    func buttonSize(_ button: UIButton, color: UIColor) {
        
        button.backgroundColor = .yellow
        button.frame.size = CGSize(width: 2000, height: 2000)
        button.addTarget(self, action: #selector(changeColor(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        let buttonConstraints = [
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor)]
        NSLayoutConstraint.activate(buttonConstraints)

    }
    
    @objc func changeColor(sender: Any) {
        if let profileController = profileViewController as? ProfileViewController {
            profileController.testColor = .red
        }
    }
}
