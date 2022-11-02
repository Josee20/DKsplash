//
//  MainViewModel.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import Foundation

final class EditorialViewModel: MainVMProtocol {
    
    public var mainModelList: MObservable<[MainModel]> = MObservable(value: [])
    internal var photoTitle: MObservable<String> = MObservable(value: "Editorial") // 상수는 프로토콜 채택 불가함
    public var currentPage: MObservable<Int> = MObservable(value: 1)
    public var totalPages: MObservable<Int> = MObservable(value: 0)
    
    public func showPhotos() {
        APIManager.shared.requestSearchPhtosData(type: .searchPhotos, title: photoTitle.value, page: currentPage.value) { json in
            
            self.totalPages.value = json["total_pages"].intValue
            
            // += 으로 해주어야 계속 데이터가 추가가됨!!! = (X)
            self.mainModelList.value += json["results"].arrayValue.map {
                MainModel(
                    imageURL: URL(string: $0["urls"]["regular"].stringValue)!,
                    writer: $0["user"]["name"].stringValue
                )
            }
        }
    }
}
