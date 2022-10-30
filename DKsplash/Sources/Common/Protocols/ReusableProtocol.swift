//
//  ReusableProtocol.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import UIKit

protocol ReusableProtocol: AnyObject {
    static var reuseIdentifier: String { get }
}

protocol MainVMProtocol {
    var mainModelList: Observable<[MainModel]> { get }
    var photoTitle: Observable<String> { get }
    var currentPage: Observable<Int> { get }
    var totalPages: Observable<Int> { get }
    
    func showPhotos()
}

extension UIViewController: ReusableProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

