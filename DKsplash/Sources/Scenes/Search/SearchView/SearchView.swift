//
//  SearchView.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import UIKit

final class SearchView: BaseView {
    
    let scrollView: UIScrollView = {
       let view = UIScrollView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    
    public let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .systemBackground
//        view.isScrollEnabled = false
        return view
    }()
    
    override func configureUI() {
        
        self.contentView.addSubview(tableView)
        self.scrollView.addSubview(contentView)
        self.addSubview(scrollView)
    }
    
    override func setConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(2000)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.snp.width)
            $0.height.equalTo(UIScreen.main.bounds.height * 5)
        }
        
        tableView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
