//
//  BaseView.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import UIKit
import SnapKit

open class BaseView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        setConstraints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() { }
    func setConstraints() { }
}

