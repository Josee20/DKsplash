//
//  URL+.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/29.
//

import Foundation

extension URL {
    static let searchPhotosURL = "https://api.unsplash.com/search/"
    
    static func makeSearchPhotosEndPointString(_ endpoint: String) -> String {
        return searchPhotosURL + endpoint
    }
    
}
