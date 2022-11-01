//
//  SearchCollectionViewCell.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/31.
//

import UIKit

final class SearchCollectionViewCell: BaseCollectionViewCell {
    
    public let photoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "star")
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func configureUI() {
        self.contentView.addSubview(photoImage)
    }
    
    override func setConstraints() {
        photoImage.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
