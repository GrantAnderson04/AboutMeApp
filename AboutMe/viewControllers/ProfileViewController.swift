//
//  ProfileViewController.swift
//  AboutMe
//
//  Created by Grant Anderson on 3/29/23.
//
import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let newView = UIView()
        newView.backgroundColor = UIColor.red
        view.addSubview(newView)
        
        //           newView.translatesAutoresizingMaskIntoConstraints = false
        //        let constraintss = [
        //        newView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        //        newView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        //           newView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        //            newView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        //            ]
        //           NSLayoutConstraint.activate(constraintss)
        // MARK: BACKGROUND VIEW
        viewForPictures.translatesAutoresizingMaskIntoConstraints = false
        let constraintPictures = [
            viewForPictures.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            viewForPictures.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            viewForPictures.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewForPictures.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ]
        NSLayoutConstraint.activate(constraintPictures)
        
        // MARK: HEADER
        header.translatesAutoresizingMaskIntoConstraints = false
        let headerConstraints = [
//        header.bottomAnchor.constraint(equalTo: viewForPictures.topAnchor),
        header.topAnchor.constraint(equalTo: view.topAnchor),
        header.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        header.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        header.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),

        ]
        NSLayoutConstraint.activate(headerConstraints)
//        if let image = UIImage(named: "Grant") {
//            header.backgroundColor = UIColor(patternImage: image)
//            header.contentMode = .scaleAspectFill
//        }
        
        // MARK: Profile Picture
        

        let profilePicture = UIImageView()
        profilePicture.image = UIImage(named: "Grant")
        profilePicture.contentMode = .scaleToFill
        profilePicture.translatesAutoresizingMaskIntoConstraints = false

        let profilePictureConstraints = [
        profilePicture.leadingAnchor.constraint(equalTo: header.leadingAnchor),
        profilePicture.trailingAnchor.constraint(equalTo: header.trailingAnchor),
        profilePicture.topAnchor.constraint(equalTo: header.topAnchor),
        profilePicture.heightAnchor.constraint(equalTo: header.heightAnchor),
        ]
        header.addSubview(profilePicture)
        NSLayoutConstraint.activate(profilePictureConstraints)
        
        
        // MARK: RECT1
        
        let rect1 = UIButton()
        
        rect1.translatesAutoresizingMaskIntoConstraints = false
        rect1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        rect1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        let rect1Contraints = [
            rect1.leftAnchor.constraint(equalTo: viewForPictures.leftAnchor, constant: 10),
            rect1.bottomAnchor.constraint(equalTo: viewForPictures.bottomAnchor, constant: -20)]
        
        rect1.backgroundColor = .green
        rect1.setTitle("Family", for: .normal)
        rect1.addTarget(self, action: #selector(self.rect1ButtonTapped(sender:)), for: .touchUpInside)
        viewForPictures.addSubview(rect1)
        NSLayoutConstraint.activate(rect1Contraints)
    }
    
    
    //MARK: views
    
    @IBOutlet weak var viewForPictures: UIView!
    
    @IBOutlet weak var header: UIView!
    
//    @IBOutlet weak var profilePicture: UIImageView!
    
    @objc func rect1ButtonTapped(sender : UIButton) {
        let familyViewController = FamilyViewController()
        navigationController?.pushViewController(familyViewController, animated: false)
    }
}
