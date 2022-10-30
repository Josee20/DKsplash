//
//  Observable.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import Foundation

class Observable<T> {
    
    var listener: ( (T) -> Void )?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(completion: @escaping (T) -> Void) {
        completion(value)
        listener = completion
    }
}
