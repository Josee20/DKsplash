//
//  WallpapersViewModel.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/29.
//

import Foundation

final class WallpapersViewModel: MainVMProtocol {
    
    public var mainModelList: Observable<[MainModel]> = Observable(value: [])
    internal var photoTitle: Observable<String> = Observable(value: "Wallpapers")
    public var currentPage: Observable<Int> = Observable(value: 1)
    public var totalPages: Observable<Int> = Observable(value: 0)
    
    public func showPhotos() {
        APIManager.shared.requestPhtosData(type: .searchPhotos, title: photoTitle.value, page: currentPage.value, completion: { json in
            
            self.totalPages.value = json["total_pages"].intValue
            
            self.mainModelList.value += json["results"].arrayValue.map {
                MainModel(
                    imageURL: URL(string: $0["urls"]["regular"].stringValue)!,
                    writer: $0["user"]["name"].stringValue
                )
            }
        })
    }
}
