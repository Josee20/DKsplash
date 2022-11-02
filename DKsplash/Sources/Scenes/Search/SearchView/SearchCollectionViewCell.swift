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
        view.backgroundColor = .lightGray
        return view
    }()
    
    public let categoryLabel: UILabel = {
        let view = UILabel()
        view.text = "abcd"
        return view
    }()
    
    override func configureUI() {
        self.contentView.addSubview(photoImage)
        self.contentView.addSubview(categoryLabel)
    }
    
    override func setConstraints() {
        photoImage.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.center.equalTo(self)
        }
    }
}
