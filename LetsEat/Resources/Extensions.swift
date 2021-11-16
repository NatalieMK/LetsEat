//
//  Extensions.swift
//  LetsEat
//
//  Created by Natalie on 11/10/21.
//

import Foundation
import UIKit

extension UIView {
    
    public var width: CGFloat {
        return self.frame.size.width
    }
    public var height: CGFloat{
        return self.frame.size.height
        
    }
    
    public var top: CGFloat{
        return self.frame.origin.y
    }
    public var bottom: CGFloat{
        return self.frame.size.height + self.frame.origin.y
    }
    
    public var left: CGFloat{
        return self.frame.origin.x
        
    }
    public var right: CGFloat{
        return self.frame.size.width + self.frame.origin.x
    }
    
    func blink(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, alpha: CGFloat = 0.0) {
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut, .repeat, .autoreverse], animations: {
            self.alpha = alpha
        })
    }
}

extension UIApplication {
    class func isFirstLaunch() -> Bool {
        if !UserDefaults.standard.bool(forKey: "hasBeenLaunchedBeforeFlag") {
            UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBeforeFlag")
            UserDefaults.standard.synchronize()
            return true
        }
        return false
    }
}

extension UIColor{
    static let lavendar = UIColor(red: 220/255, green: 209/255, blue: 255/255, alpha: 1.0)
    static let lightBlue = UIColor(red: 153/255, green: 204/255, blue: 255/255, alpha: 1.0)
    static let salmon = UIColor(red: 255/255, green:164/255, blue: 185/255, alpha: 1.0)
}

extension UIViewController{
    
     func failedToFetch(){
        print("Something went wrong")
    }
}

extension UITableViewController{
    
    func populateMealList(with model: MealList) -> [String]{
        let meals = model.meals
        var categorizedList = [String]()
        for meal in meals{
            categorizedList.append(meal.strMeal)
        }
        return categorizedList
    }
}

extension String {
 
    func index(at position: Int, from start: Index? = nil) -> Index? {
        let startingIndex = start ?? startIndex
        return index(startingIndex, offsetBy: position, limitedBy: endIndex)
    }
 
    func character(at position: Int) -> Character? {
        if (self.isEmpty){
            return nil
        }
        guard position >= 0, let indexPosition = index(at: position) else {
            return nil
        }
        return self[indexPosition]
    }
}

