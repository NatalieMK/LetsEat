//
//  FillerViewController.swift
//  LetsEat
//
//  Created by Natalie on 11/10/21.
//

import UIKit

class WelcomeViewController: UIViewController {


    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "takeoutbag.and.cup.and.straw")
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Let's Eat!"
        view.backgroundColor = .white
        
        // Add subviews
        
        view.addSubview(imageView)
        
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(screenTapped))
        view.addGestureRecognizer(gesture)
        gesture.numberOfTapsRequired = 1

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.width/3
        
        
        imageView.frame = CGRect(x: (view.width - size)/2,
                                 y: view.height/3,
                                 width: size,
                                 height: size)
    }
    
    @objc private func screenTapped(){
        print("tapped")
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
