//
//  EditorialView.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import UIKit

final class EditorialView: BaseView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        let height = width
        
        layout.itemSize = CGSize(width: width, height: width)
        layout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    override func configureUI() {
        self.addSubview(collectionView)
    }
    
    override func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
