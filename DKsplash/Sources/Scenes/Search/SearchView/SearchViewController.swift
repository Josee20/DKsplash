//
//  SearchViewController.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import UIKit
import RxSwift
import RxCocoa

final class SearchViewController: BaseViewController {
    
    private let mainView = SearchView()
    private let viewModel = SearchViewModel()
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchController()
        viewModel.showPhotos()
        
        
        
    }
    
    override func configure() {
        mainView.tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.reuseIdentifier)
        mainView.tableView.register(RandomPhotoTableViewCell.self, forCellReuseIdentifier: RandomPhotoTableViewCell.reuseIdentifier)
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    private func setSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색"
        searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reuseIdentifier, for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
                
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RandomPhotoTableViewCell.reuseIdentifier, for: indexPath) as? RandomPhotoTableViewCell else { return UITableViewCell() }
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UIScreen.main.bounds.height / 3.8
        } else {
            return UIScreen.main.bounds.height * 3
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return Header.cateogry.requestHeader
        } else {
            return Header.random.requestHeader
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
