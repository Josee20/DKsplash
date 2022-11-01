//
//  SearchTableViewCell.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/31.
//

import UIKit

class CategoryTableViewCell: BaseTableViewCell {
    
    private let categoryCollectionViewFlowLayout: UICollectionViewFlowLayout = { (scroll: UICollectionView.ScrollDirection , divider: CGFloat) in
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 8
        let width = UIScreen.main.bounds.width / divider
        let height = width
        
        layout.itemSize = CGSize(width: width, height: height)
        layout.scrollDirection = scroll
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        
        return layout
    }(.horizontal, 3.9)
    
    lazy var categoryCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.categoryCollectionViewFlowLayout)
        view.isScrollEnabled = true
        view.backgroundColor = .systemPink
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.reuseIdentifier)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    override func configureUI() {
        self.contentView.addSubview(categoryCollectionView)
        self.categoryCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.reuseIdentifier)
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
    }
    
    override func setConstraints() {
        
        categoryCollectionView.snp.makeConstraints {
            $0.topMargin.equalTo(0)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
    }
}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
             
        return cell
    }
}
