//
//  randomPhotoTableViewCell.swift
//  DKsplash
//
//  Created by 이동기 on 2022/11/01.
//

import UIKit

class RandomPhotoTableViewCell: BaseTableViewCell {
    
    private let randomCollectionViewFlowLayout: UICollectionViewFlowLayout = { (scroll: UICollectionView.ScrollDirection , divider: CGFloat) in
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 4
        let width = (UIScreen.main.bounds.width - space) / divider
        let height = width
        
        layout.itemSize = CGSize(width: width, height: width)
        layout.scrollDirection = scroll
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        
        return layout
    }(.vertical, 2)
    
    lazy var randomCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.randomCollectionViewFlowLayout)
        view.isScrollEnabled = true
        view.backgroundColor = .systemRed
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    override func configureUI() {
        self.contentView.addSubview(randomCollectionView) // 셀의 컨텐츠뷰로 들어가야 스크롤이됨
        self.randomCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.reuseIdentifier)
        self.randomCollectionView.delegate = self
        self.randomCollectionView.dataSource = self
    }
    
    override func setConstraints() {
        randomCollectionView.snp.makeConstraints {
            
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension RandomPhotoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
             
        return cell
    }
}

