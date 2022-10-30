//
//  CurrentEventsViewController.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import UIKit

final class CurrentEventsViewController: BaseViewController {
    
    let mainView = CurrentEventsView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

