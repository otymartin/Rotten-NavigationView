//
//  ViewControllers.swift
//  Rotten NavigationView
//
//  Created by Martin Otyeka on 2020-09-14.
//  Copyright © 2020 Rotten Apple. All rights reserved.
//

import UIKit
import Tabman
import Pageboy
import SwiftUI

final class MainViewController: TabmanViewController {
    
    var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isScrollEnabled = false
        loadViewControllers()
        addTabBar()
        dataSource = self // Reloads dataSource when set
    }
    
    func loadViewControllers() {
        viewControllers.append(FirstViewController())
        viewControllers.append(SecondViewController())
    }
}

extension MainViewController: PageboyViewControllerDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        .first
    }
}

// MARK: - FIRST VIEWCONTROLLER

final class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        add(UIHostingController(rootView: FirstView()))
    }
}

// MARK: - SECOND VIEWCONTROLLER

final class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        add(UIHostingController(rootView: SecondView()))
    }
}
