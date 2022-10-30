//
//  APIManager.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/29.
//

import Alamofire
import SwiftyJSON

class APIManager {
    
    private init() { }
    
    static let shared = APIManager()
    
    func requestPhtosData(type: EndPoint, title: String, page: Int, completion: @escaping (JSON) -> () ) {
        
        let url = type.requestURL + APIKey.UnsplashKey + "&page=\(page)&query=\(title)"
        
        AF.request(url, method: .get).validate(statusCode: 200...500).responseData { response in
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                
                completion(json)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}