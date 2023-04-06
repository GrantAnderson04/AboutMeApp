//
//  ProfileViewController.swift
//  AboutMe
//
//  Created by Grant Anderson on 3/29/23.
//
import UIKit

class ProfileViewController: UIViewController {
   var testColor : UIColor = .lightGray
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newView = UIView()
        newView.backgroundColor = .lightGray
        view.addSubview(newView)
        viewForPictures.backgroundColor = testColor
            

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
        
        
        // MARK: Profile Picture view
        
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
        
        // MARK: Family Button
        
        let rect1 = UIButton()
        
        rect1.translatesAutoresizingMaskIntoConstraints = false
        rect1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        rect1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        let rect1Contraints = [
            rect1.leftAnchor.constraint(equalTo: viewForPictures.leftAnchor, constant: 10),
            rect1.bottomAnchor.constraint(equalTo: viewForPictures.bottomAnchor, constant: -20),
            rect1.trailingAnchor.constraint(equalTo: viewForPictures.centerXAnchor, constant: -5)]
        rect1.layer.cornerRadius = 20
        
        rect1.imageInButton(nameOfImage: "owls")
        rect1.labelInMiddle(nameOfLabel: "Family", labelColor: .black)
        rect1.backgroundColor = .green
        rect1.setTitle("", for: .normal)
        rect1.addTarget(self, action: #selector(self.rect1ButtonTapped(sender:)), for: .touchUpInside)
        viewForPictures.addSubview(rect1)
        NSLayoutConstraint.activate(rect1Contraints)
        
        //MARK: About me button
        
        let rect2 = UIButton()
        rect2.translatesAutoresizingMaskIntoConstraints = false
        
        let rect2Contraints = [
            rect2.leftAnchor.constraint(equalTo: viewForPictures.leftAnchor, constant: 10),
            rect2.bottomAnchor.constraint(equalTo: rect1.topAnchor, constant: -10),
            rect2.trailingAnchor.constraint(equalTo: viewForPictures.centerXAnchor, constant: -5),
            rect2.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            rect2.widthAnchor.constraint(equalToConstant: 200),
            rect2.heightAnchor.constraint(equalToConstant: 200)]
        
        
        rect2.layer.cornerRadius = 20
        rect2.imageInButton(nameOfImage: "AboutMeImage")
        rect2.labelInMiddle(nameOfLabel: "About Me", labelColor: .black)
        rect2.backgroundColor = .systemPink
        rect2.addTarget(self, action: #selector(self.rect2ButtonTapped(sender:)), for: .touchUpInside)
        viewForPictures.addSubview(rect2)
        NSLayoutConstraint.activate(rect2Contraints)
        
        //MARK: Game Button
        
        let rect3 = UIButton()
        rect3.translatesAutoresizingMaskIntoConstraints = false
        viewForPictures.addSubview(rect3)
        
        let rect3Constraints = [
            rect3.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 250),
            rect3.bottomAnchor.constraint(equalTo: viewForPictures.bottomAnchor, constant: -20),
            rect3.leadingAnchor.constraint(equalTo: viewForPictures.centerXAnchor, constant: 5),
            rect3.trailingAnchor.constraint(equalTo: viewForPictures.trailingAnchor, constant: -10)]
        rect3.layer.cornerRadius = 20
        rect3.backgroundColor = .white
        rect3.imageInButton(nameOfImage: "Game")
        rect3.labelInMiddle(nameOfLabel: "Game", labelColor: .black)
        rect3.addTarget(self, action: #selector(self.rect3ButtonTapped(sender:)), for: .touchUpInside)
        NSLayoutConstraint.activate(rect3Constraints)
        
        //MARK: Business Button
        
        let rect4 = UIButton()
        
        rect4.translatesAutoresizingMaskIntoConstraints = false
        viewForPictures.addSubview(rect4)
        
        let rect4Constraints = [
            rect4.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            rect4.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: 240),
            rect4.leadingAnchor.constraint(equalTo: viewForPictures.centerXAnchor, constant: 5),
            rect4.trailingAnchor.constraint(equalTo: viewForPictures.trailingAnchor, constant: -10)]
        rect4.layer.cornerRadius = 20
        rect4.backgroundColor = .brown
        rect4.imageInButton(nameOfImage: "")
        rect4.labelInMiddle(nameOfLabel: "Business", labelColor: .black)
        rect4.addTarget(self, action: #selector(self.rect4ButtonTapped(sender:)), for: .touchUpInside)
        NSLayoutConstraint.activate(rect4Constraints)
        
        //MARK: Socials button
        
        let rect5 = UIButton()
        
        rect5.translatesAutoresizingMaskIntoConstraints = false
        viewForPictures.addSubview(rect5)
        
        let rect5Contraints = [
            rect5.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            rect5.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: 180),
            rect5.leadingAnchor.constraint(equalTo: viewForPictures.centerXAnchor, constant: 5),
            rect5.trailingAnchor.constraint(equalTo: viewForPictures.trailingAnchor, constant: -10)]
        rect5.layer.cornerRadius = 20
        rect5.backgroundColor = .cyan
        rect5.labelInMiddle(nameOfLabel: "Socials", labelColor: .black)
        rect5.imageInButton(nameOfImage: "")
        rect5.addTarget(self, action: #selector(self.rect5ButtonTapped(sender:)), for: .touchUpInside)
        NSLayoutConstraint.activate(rect5Contraints)
        
        //MARK: Backgrounds button
        
        let rect6 = UIButton()
        
        rect6.translatesAutoresizingMaskIntoConstraints = false
        viewForPictures.addSubview(rect6)
        
        let rect6Contraints = [
            rect6.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            rect6.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: 120),
            rect6.leadingAnchor.constraint(equalTo: viewForPictures.centerXAnchor, constant: 5),
            rect6.trailingAnchor.constraint(equalTo: viewForPictures.trailingAnchor, constant: -10)]
        rect6.layer.cornerRadius = 20
        rect6.backgroundColor = .gray
        rect6.labelInMiddle(nameOfLabel: "Background", labelColor: .black)
        rect6.imageInButton(nameOfImage: "")
        rect6.addTarget(self, action: #selector(self.rect6ButtonTapped(sender:)), for: .touchUpInside)
        NSLayoutConstraint.activate(rect6Contraints)

    }
    
    
    
    //MARK: views
    
    @IBOutlet weak var viewForPictures: UIView!
    
    @IBOutlet weak var header: UIView!
    
    //MARK: Navigation functionality
    
    @objc func rect1ButtonTapped(sender : UIButton) {
        let familyViewController = FamilyViewController()
        navigationController?.pushViewController(familyViewController, animated: true)
    }
    
    @objc func rect2ButtonTapped(sender : UIButton) {
        let aboutMeViewController = AboutMeViewController()
        navigationController?.pushViewController(aboutMeViewController, animated: true)
    }
    
    @objc func rect3ButtonTapped(sender : UIButton) {
        let gameViewController = GameViewController()
        navigationController?.pushViewController(gameViewController, animated: true)
    }
    
    @objc func rect4ButtonTapped(sender : UIButton) {
        let businessViewController = BusinessViewController()
        navigationController?.pushViewController(businessViewController, animated: true)
    }
        
    @objc func rect5ButtonTapped(sender : UIButton) {
        let socialsViewController = SocialsViewController()
        navigationController?.pushViewController(socialsViewController, animated: true)
    }
    
    @objc func rect6ButtonTapped(sender : UIButton) {
        let backgroundViewController = BackgroundViewController()
        navigationController?.pushViewController(backgroundViewController, animated: true)
    }
    
//    @objc func changeBackgroundColor(sender : UIButton) {
//        profilePi
//    }

}
