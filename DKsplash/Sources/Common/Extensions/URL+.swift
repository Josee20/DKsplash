//
//  URL+.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/29.
//

import Foundation

extension URL {
    static let searchPhotosURL = "https://api.unsplash.com/search/"
    static let randomPhotosURL = "https://api.unsplash.com/photos/random"
    
    static func makeSearchPhotosEndPointString(_ endpoint: String) -> String {
        return searchPhotosURL + endpoint
    }
    
    static func makeRandomPhotosEndPointString(_ endpoint: String) -> String {
        return randomPhotosURL + endpoint
    }
    
}
