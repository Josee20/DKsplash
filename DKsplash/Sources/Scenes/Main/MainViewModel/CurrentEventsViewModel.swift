//
//  CurrentEventsViewModel.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/29.
//

import Foundation

final class CurrentEventsViewModel: MainVMProtocol {
    
    public var mainModelList: MObservable<[MainModel]> = MObservable(value: [])
    internal var photoTitle: MObservable<String> = MObservable(value: "CurrentEvents")
    public var currentPage: MObservable<Int> = MObservable(value: 1)
    public var totalPages: MObservable<Int> = MObservable(value: 0)
    
    public func showPhotos() {
        APIManager.shared.requestSearchPhtosData(type: .searchPhotos, title: photoTitle.value, page: currentPage.value, completion: { json in
            
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
