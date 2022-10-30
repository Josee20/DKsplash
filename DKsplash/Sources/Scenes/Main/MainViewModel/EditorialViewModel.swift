//
//  MainViewModel.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import Foundation

final class EditorialViewModel {
    
    public var mainModelList: Observable<[MainModel]> = Observable(value: [])
    
    private let photoTitle: Observable<String> = Observable(value: "Editorial")
    public var currentPage: Observable<Int> = Observable(value: 1)
    
    public func showPhotos() {
        APIManager.shared.requestPhtosData(type: .searchPhotos, title: photoTitle.value, page: currentPage.value) { json in
            
            self.mainModelList.value = json["results"].arrayValue.map {
                MainModel(
                    imageURL: URL(string: $0["urls"]["small"].stringValue)!,
                    writer: $0["user"]["name"].stringValue
                )
            }
            
//            print("=========\(self.mainModelList.value)")
        }
    }
}
