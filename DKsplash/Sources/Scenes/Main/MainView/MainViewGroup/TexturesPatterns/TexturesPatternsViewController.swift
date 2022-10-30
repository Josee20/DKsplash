//
//  TexturesPatternsViewController.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import UIKit

final class TexturesPatternsViewController: BaseViewController {
    
    let mainView = TexturesPatternsView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

