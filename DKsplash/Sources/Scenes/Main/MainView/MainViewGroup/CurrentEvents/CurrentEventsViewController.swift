//
//  CurrentEventsViewController.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import UIKit

final class CurrentEventsViewController: BaseViewController {
    
    private let mainView = CurrentEventsView()
    private let viewModel = CurrentEventsViewModel()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.mainModelList.bind { _ in
            self.mainView.collectionView.reloadData()
            print("++++++++++++++\(self.viewModel.totalPages.value)")
            print("==============\(self.viewModel.currentPage.value)")
        }
        
        viewModel.showPhotos()
    }
    
    override func configure() {
        mainView.collectionView.register(ReusableCollectionViewCell.self, forCellWithReuseIdentifier: ReusableCollectionViewCell.reuseIdentifier)
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.prefetchDataSource = self
    }
}

extension CurrentEventsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.mainModelList.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReusableCollectionViewCell.reuseIdentifier, for: indexPath) as? ReusableCollectionViewCell else { return UICollectionViewCell() }
        
        cell.photoImageView.kf.setImage(with: viewModel.mainModelList.value[indexPath.item].imageURL)
        cell.nameLabel.text = viewModel.mainModelList.value[indexPath.item].writer
        
        return cell
    }
}

extension CurrentEventsViewController: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        indexPaths.forEach {
            if viewModel.mainModelList.value.count - 1 == $0.item && viewModel.currentPage.value < viewModel.totalPages.value {
                viewModel.currentPage.value += 1
                viewModel.showPhotos()
            }
        }
    }
}

