//
//  EndPoint.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import Foundation

enum EndPoint {
    case searchPhotos
    case randomPhotos
    
    var requestURL: String {
        switch self {
        case .searchPhotos:
            return URL.makeSearchPhotosEndPointString("photos?client_id=")
        case .randomPhotos:
            return URL.makeRandomPhotosEndPointString("?client_id=")
        }
    }
}
