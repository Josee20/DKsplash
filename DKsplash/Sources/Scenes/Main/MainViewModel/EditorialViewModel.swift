//
//  MainViewModel.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import Foundation

final class EditorialViewModel: MainVMProtocol {
    
    public var mainModelList: Observable<[MainModel]> = Observable(value: [])
    internal var photoTitle: Observable<String> = Observable(value: "Editorial") // 상수는 프로토콜 채택 불가함
    public var currentPage: Observable<Int> = Observable(value: 1)
    public var totalPages: Observable<Int> = Observable(value: 0)
    
    public func showPhotos() {
        APIManager.shared.requestPhtosData(type: .searchPhotos, title: photoTitle.value, page: currentPage.value) { json in
            
            self.totalPages.value = json["total_pages"].intValue
            
            // += 으로 해주어야 계속 데이터가 추가가됨!!! = (X)
            self.mainModelList.value += json["results"].arrayValue.map {
                MainModel(
                    imageURL: URL(string: $0["urls"]["small"].stringValue)!,
                    writer: $0["user"]["name"].stringValue
                )
            }
        }
    }
}
