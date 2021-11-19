//
//  RecipeViewController.swift
//  Let's Eat : A Recipe App
//
//  Created by Natalie on 11/10/21.
//

import UIKit

class RecipeViewController: UIViewController {

    public var mealName: String = ""
    public var ingredients: [String?] = []
    public var measurements: [String?] = []
    public var instructions: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lavendar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (mealName != ""){
            // display name
            print(mealName)
        }
        if (ingredients != []){
            print(ingredients)
        }
        if (measurements != []){
            print(measurements)
        }
        if (instructions != ""){
            print(instructions)
        }
    }

}
