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
    var mainModelList: MObservable<[MainModel]> { get }
    var photoTitle: MObservable<String> { get }
    var currentPage: MObservable<Int> { get }
    var totalPages: MObservable<Int> { get }
    
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

