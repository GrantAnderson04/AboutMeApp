//
//  SplashScreenViewController.swift
//  AboutMe
//
//  Created by Grant Anderson on 4/4/23.
//

import Foundation
import UIKit
class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var stickmanImageView: UIImageView!
    
    var stickImages: [UIImage] = []
    
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)\(imageCount)"
            let image = UIImage(named: imageName)!
            
            imageArray.append(image)
        }
        
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 1
        imageView.animationRepeatCount = 4
        imageView.startAnimating()
        
    }
    
    override func viewDidLoad() {
        let loadingLabel = UILabel()
        view.addSubview(loadingLabel)
        
        stickImages = createImageArray(total: 14, imagePrefix: "stick")
        
        animate(imageView: stickmanImageView, images: stickImages)
        stickmanImageView.image = UIImage(named: "stick13"); DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            self.performSegue(withIdentifier: "OpenMenu", sender: nil)
            
            
        }
    }
    
}

