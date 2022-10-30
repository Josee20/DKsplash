//
//  TabManCollectionViewCell.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/29.
//

import UIKit

class ReusableCollectionViewCell: BaseCollectionViewCell {
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .boldSystemFont(ofSize: 14)
        return view
    }()
    
    let photoImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    override func configureUI() {
        [photoImageView, nameLabel].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        
        photoImageView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(photoImageView.snp.leading).inset(20)
            $0.bottom.equalTo(photoImageView.snp.bottom).inset(16)
        }
    }
}
