//
//  SearchViewModel.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftyJSON

enum Header {
    case cateogry
    case random
    
    var requestHeader: String {
        switch self {
        case .cateogry:
            return "카테고리"
        case .random:
            return "찾기"
        }
    }
}

final class SearchViewModel {
    
    private let disposeBag = DisposeBag()
    public var subjectSearchModelList: BehaviorSubject<[MainModel]> = BehaviorSubject(value: [])
    public var subjectCount: BehaviorSubject<Int> = BehaviorSubject(value: 30)
    
    public let categoryList: [String] = ["자연", "블랙앤화이트", "우주", "동물", "꽃", "심해", "건축물", "텍스쳐", "추상적인", "미니멀", "하늘", "여행", "드론", "그라디언트"]
    
    public func showPhotos() {
        APIManager.shared.requestRandomPhotosData(type: .randomPhotos, count: try! subjectCount.value() ) { json in
            
            var tempModelList: [MainModel] = []
            
            tempModelList.append(contentsOf: json.arrayValue.map {
                MainModel(
                    imageURL: URL(string: $0["urls"]["regular"].stringValue)!,
                    writer: $0["user"]["name"].stringValue
                    )
                }
            )
            
            self.subjectSearchModelList
                .onNext(tempModelList)
        }
    }
}
