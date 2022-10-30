//
//  EditionalViewController.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import UIKit
import Kingfisher

final class EditorialViewController: BaseViewController {
    
    private let mainView = EditorialView()
    private let viewModel = EditorialViewModel()
    
    private var page = 0
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.currentPage.bind { value in
            self.page = value
        }
        
        // 처음엔 mainModelList의 데이터가 안들어온다.
        // 하지만 나중엔 들어오게 되는데 이 때 데이터가 들어와서 옵저버블에 의해 반응이 일어나게된다.
        // 이 때 반응할 때 reloadData()를 써주게 되면 뷰가 리로드 되어 나타나게 되는 것이다.
        // 즉 데이터가 들어온 시점에 reloadData()를 써줄 수 있다는 것이다.
        viewModel.mainModelList.bind { _ in
            self.mainView.collectionView.reloadData()
        }
        
        viewModel.showPhotos()
    }
    
    override func configure() {
        mainView.collectionView.register(ReusableCollectionViewCell.self, forCellWithReuseIdentifier: ReusableCollectionViewCell.reuseIdentifier)
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
}

extension EditorialViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
