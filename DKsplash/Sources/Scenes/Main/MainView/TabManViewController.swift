//
//  MainViewController.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/28.
//

import UIKit
import Tabman
import Pageboy

final class TabManViewController: TabmanViewController {
    
    let mainView = TabManView()
    
    var viewControllers: [BaseViewController] = [
        EditorialViewController(),
        FoodDrinkViewController(),
        CurrentEventsViewController(),
        WallpapersViewController(),
        RendersViewController(),
        TexturesPatternsViewController()
    ]
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "DKSplash"
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        settingTabBar(ctBar: bar)
        addBar(bar, dataSource: self, at: .top)
    }
    
    func settingTabBar(ctBar: TMBar.ButtonBar) {

        ctBar.layout.transitionStyle = .snap
        // 왼쪽 여백주기
        ctBar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 20.0)

        // 간격
        ctBar.layout.interButtonSpacing = 20
        ctBar.backgroundView.style = .clear

        // 선택 & 선택X시 색 + 폰트사이즈
        ctBar.buttons.customize { (button) in
            button.tintColor = .white
            button.selectedTintColor = .white
            button.font = UIFont.systemFont(ofSize: 16)
            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        }

        // 인디케이터
        ctBar.indicator.weight = .custom(value: 2)
        ctBar.indicator.tintColor = .white
    }
}

extension TabManViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        return nil
    }
    
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        switch index {
        case 0:
            return TMBarItem(title: "Editional")
        case 1:
            return TMBarItem(title: "Food & Drink")
        case 2:
            return TMBarItem(title: "Current Events")
        case 3:
            return TMBarItem(title: "Wallpapers")
        case 4:
            return TMBarItem(title: "3D Renders")
        case 5:
            return TMBarItem(title: "Textures & Patterns")
        default:
            return TMBarItem(title: "Empty")
        }
    }
}
