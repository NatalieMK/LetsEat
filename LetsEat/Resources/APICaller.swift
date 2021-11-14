//
//  APICaller.swift
//  LetsEat
//
//  Created by Natalie on 11/12/21.
//

import Foundation

final class APICaller{
    
    static let shared = APICaller()
    private init() {}
    
    enum APIError: Error {
        case defaultError
    }
    
//    enum APISuccess: Codable {
//        case mealList(MealList)
//        case areaList(AreaList)
//        case recipeList(RecipeList)
//    }
    
    struct URLConstants {
 
        // URL stub for listing items (i.e. list of categories, areas, all ingredients with definitions).
        static let listStub = "https://www.themealdb.com/api/json/v1/1/list.php?"
        
        //URL stub for looking up recipe from meal ID.
        static let lookupStub = "www.themealdb.com/api/json/v1/1/lookup.php?"
        
        //URL stub for search actions (i.e. search for meal by name, by first letter).
        static let searchStub = "https://www.themealdb.com/api/json/v1/1/search.php?"
        
        //URL stub for filter actions (i.e. filter by category, main ingredient, or area)
        static let filterStub = "www.themealdb.com/api/json/v1/1/filter.php?"
    }

    public func getListData<T:Codable>(with chosenString: String, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void){
        
        let fullURL = URL(string: URLConstants.listStub + chosenString)
        createRequest(with: fullURL) { dataRequest in
            let task = URLSession.shared.dataTask(with: dataRequest) {data, _,
                error in
                guard let data = data, error == nil else{
                    completion(.failure(APIError.defaultError))
                    return
                }
                
                do {
                    print(data)
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                }
                
                catch {
                    print(String(describing: error))
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
                
            }
            task.resume()
        }
    }
    
    public func getLookupData() {}
    
    public func getSearchedData<T:Codable>(with chosenString: String, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void){
        
        let fullURL = URL(string: URLConstants.searchStub + chosenString)
        createRequest(with: fullURL) { dataRequest in
            let task = URLSession.shared.dataTask(with: dataRequest) {data, _,
                error in
                guard let data = data, error == nil else{
                    completion(.failure(APIError.defaultError))
                    return
                }
                
                do {
                    print(data)
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                }
                
                catch {
                    print(String(describing: error))
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
                
            }
            task.resume()
        }
    }
    public func getFilteredData() {}
    
    
    public func createRequest(with url: URL?, completion: @escaping (URLRequest) -> Void){
        guard let apiURL = url else{
            return
        }
        var request = URLRequest(url:apiURL)
        completion(request)
    }
}

