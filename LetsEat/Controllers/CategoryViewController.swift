//
//  CategoryViewController.swift
//  Let's Eat : A Recipe App
//
//  Created by Natalie on 11/10/21.
//

import UIKit

class CategoryViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightBlue
        title = "Categories"
    }
    
    @objc func goBack(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    

                        
}
