//
//  PageViewControllers.swift
//  Rotten NavigationView
//
//  Created by Martin Otyeka on 2020-09-14.
//  Copyright © 2020 Rotten Apple. All rights reserved.
//

import UIKit
import Tabman
import Pageboy
import SwiftUI

final class PageViewController: TabmanViewController {
    
    var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isScrollEnabled = false
        self.addTabBar()

        //MARK: - BAND AID FIX
        // The parent view controller has not been fully presented yet, before the child view controller is presented.
        // Using Delay to load datasource only after Parent VC has been fully presented.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loadViewControllers()
            self.dataSource = self // Reloads dataSource when set
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func loadViewControllers() {
        viewControllers.append(FirstViewController())
        viewControllers.append(SecondViewController())
    }
}

extension PageViewController: PageboyViewControllerDataSource {
    
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
