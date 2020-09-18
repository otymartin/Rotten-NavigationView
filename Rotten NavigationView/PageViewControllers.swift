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

final class MainViewController: UIPageViewController, UIPageViewControllerDataSource {
    var vcs: [UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = UIViewController()
        vcs.append(vc1)
        dataSource = self
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Uncomment to delay loading Child Views
            self.setViewControllers([vc1], direction: .forward, animated: true, completion: nil)
//        }
    }
}

//
//final class MainViewController: UIPageViewController, UIPageViewControllerDataSource {
//
//    var vcs: [UIViewController] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let redVC = UIHostingController(rootView: TabView(page: "First", color: .red))
//        let blueVC = UIHostingController(rootView: TabView(page: "Second", color: .blue))
//        vcs.append(redVC)
//        vcs.append(blueVC)
//        dataSource = self
//
////        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Uncomment to delay loading Child Views
//            self.setViewControllers([redVC], direction: .forward, animated: true, completion: nil)
////        }
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        vcs.first
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        vcs.last
//    }
//
//    struct TabView: View {
//        let page: String
//        let color: UIColor
//        var body: some View {
//            NavigationView {
//                ZStack {
//                    Color(color).edgesIgnoringSafeArea(.all)
//                    Text("Swipe Page")
//                }.navigationBarTitle("", displayMode: .inline)
//                .navigationBarItems(leading: Text(page).font(Font.system(size: 24, weight: .bold)))
//            }
//        }
//    }
//}

final class PageViewController: TabmanViewController {
    
    var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isScrollEnabled = false
        self.addTabBar()

        //MARK: - BAND AID FIX
        // The parent view controller has not been fully presented yet, before the child view controller is presented.
        // Using Delay to load datasource only after Parent VC has been fully presented.
        // Alternatively, run this code in ViewDidAppear
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loadViewControllers()
            self.dataSource = self // Reloads dataSource when set
        }
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
//        add(UIHostingController(rootView: FirstView()))
    }
}

// MARK: - SECOND VIEWCONTROLLER

final class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        add(UIHostingController(rootView: SecondView()))
    }
}
