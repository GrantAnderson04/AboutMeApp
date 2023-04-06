//
//  socialsViewController.swift
//  AboutMe
//
//  Created by Grant Anderson on 4/1/23.
//

import Foundation
import UIKit

class SocialsViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .cyan
        let header = UIView()
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        let headerConstraints = [
            //        header.bottomAnchor.constraint(equalTo: viewForPictures.topAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),
            
        ]
        NSLayoutConstraint.activate(headerConstraints)
        
        let profilePicture = UIImageView()
        profilePicture.image = UIImage(named: "Grant")
        profilePicture.contentMode = .scaleToFill
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.backgroundColor = .lightGray
        
        let profilePictureConstraints = [
            profilePicture.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            profilePicture.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            profilePicture.topAnchor.constraint(equalTo: header.topAnchor),
            profilePicture.heightAnchor.constraint(equalTo: header.heightAnchor),
        ]
        header.addSubview(profilePicture)
        NSLayoutConstraint.activate(profilePictureConstraints)
        
        
        let headerLabel = UILabel()
        profilePicture.addSubview(headerLabel)
        headerLabel.text = "Grant Anderson"
        headerLabel.textColor = .white
        headerLabel.font = UIFont(name: "arial", size: 40)
        let headerLabelConstraints = [
            headerLabel.bottomAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: -10),
            headerLabel.leadingAnchor.constraint(equalTo: profilePicture.leadingAnchor, constant: 10),
            //            headerLabel.trailingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 10),
            //            headerLabel.topAnchor.constraint(equalTo: profilePicture.topAnchor, constant: 10)
        ]
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(headerLabelConstraints)
        
    }
}
