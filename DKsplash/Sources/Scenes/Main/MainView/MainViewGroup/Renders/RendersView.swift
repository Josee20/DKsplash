//
//  3DRendersView.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import UIKit

final class RendersView: BaseView {
    
    let test: UILabel = {
        let view = UILabel()
        view.text = "DK5"
        return view
    }()
    
    override func configureUI() {
        self.addSubview(test)
    }
    
    override func setConstraints() {
        test.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.center.equalTo(self)
        }
    }
}