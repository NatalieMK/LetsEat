//
//  APICaller.swift
//  LetsEat
//
//  Created by Natalie on 11/12/21.
//

import Foundation

final class APICaller{
    
    static let apiCaller = APICaller()
    private init() {}
    
    struct URLConstants {
 
        // URL stub for listing items (i.e. list of categories, areas, all ingredients with definitions).
        static let listStub = "www.themealdb.com/api/json/v1/1/list.php?"
        
        //URL stub for looking up recipe from meal ID.
        static let lookupStub = "www.themealdb.com/api/json/v1/1/lookup.php?"
        
        //URL stub for search actions (i.e. search for meal by name, by first letter).
        static let searchStub = "www.themealdb.com/api/json/v1/1/search.php?"
        
        //URL stub for filter actions (i.e. filter by category, main ingredient, or area)
        static let filterStub = "www.themealdb.com/api/json/v1/1/filter.php?"
    }
    
    public func getListedData() {}
    public func getLookupData() {}
    public func getSearchedData() {}
    public func getFilteredData() {}
    
    
    public func createRequest(with url: URL?, completion: @escaping (URLRequest) -> Void){
        guard let apiURL = url else{
            return
        }
        var request = URLRequest(url:apiURL)
        completion(request)
    }
}
