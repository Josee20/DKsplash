//
//  randomPhotoTableViewCell.swift
//  DKsplash
//
//  Created by 이동기 on 2022/11/01.
//

import UIKit
import RxSwift
import RxCocoa

class RandomPhotoTableViewCell: BaseTableViewCell {
    
    let viewModel = SearchViewModel()
    let disposeBag = DisposeBag()
    
    private let randomCollectionViewFlowLayout: UICollectionViewFlowLayout = { (scroll: UICollectionView.ScrollDirection , divider: CGFloat) in
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 4
        let width = (UIScreen.main.bounds.width - space) / divider
        let height = width * 1.5
        
        layout.itemSize = CGSize(width: width, height: height)
        layout.scrollDirection = scroll
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        
        return layout
    }(.vertical, 2)
    
    lazy var randomCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.randomCollectionViewFlowLayout)
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = false
        view.isScrollEnabled = false
        return view
    }()
    
    override func configureUI() {
        self.contentView.addSubview(randomCollectionView) // 셀의 컨텐츠뷰로 들어가야 스크롤이됨
        self.randomCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.reuseIdentifier)
        self.randomCollectionView.delegate = self
        self.randomCollectionView.dataSource = self
        
        
        
        viewModel.showPhotos()
        
        viewModel.subjectSearchModelList
            .bind { element in
                self.randomCollectionView.reloadData()
                print("#############\(element)")
            }
            .disposed(by: disposeBag)
        
//        viewModel.subjectCount
//            .bind { element in
//                print("!!!!!!!!!!!!!\(element)")
//            }
//            .disposed(by: disposeBag)
        
    }
    
    override func setConstraints() {
        randomCollectionView.snp.makeConstraints {
            
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension RandomPhotoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
        do {
            return try viewModel.subjectSearchModelList.value().count
        } catch {
            print("Random CollectionViewCell ERROR")
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        
        cell.photoImage.kf.setImage(with: try! self.viewModel.subjectSearchModelList.value()[indexPath.item].imageURL)
        cell.categoryLabel.text = try! self.viewModel.subjectSearchModelList.value()[indexPath.item].writer
            
        return cell
    }
}

