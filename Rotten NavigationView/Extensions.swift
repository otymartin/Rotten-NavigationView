//
//  Extensions.swift
//  Rotten NavigationView
//
//  Created by Martin Otyeka on 2020-09-14.
//  Copyright © 2020 Rotten Apple. All rights reserved.
//

import UIKit
import Tabman
import Pageboy
import SwiftUI


extension PageViewController {
    
    func addTabBar() {
        let bar = TMBar.TabBar()
        bar.delegate = self
        addBar(bar.systemBar(for: bar, with: .flat(color: .white)), dataSource: self, at: .bottom)
        customizeButtons(for: bar)
    }
}

//MARK: - TMBARDATASOURCE
extension PageViewController: TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let titles = ["First", "Second"]
        let icons = ["1.circle.fill", "2.circle.fill"]
        return TMBarItem(title: titles[index],
                         image: UIImage(systemName: icons[index]) ?? UIImage())
    }
}

// MARK: - TABBAR

extension PageViewController {
    
    func customizeButtons(for bar: TMBar.TabBar) {
        bar.buttons.customize { (button) in
            button.adjustsAlphaOnSelection = false
            button.selectedTintColor = .black
            button.shrinksImageWhenUnselected = false
            button.tintColor = .lightGray
            button.imageContentMode = .scaleAspectFill
            button.imageViewSize = CGSize(width: 26, height: 26)
        }
    }
}

extension TMBar {
    
    func systemBar(for bar: TMBar.TabBar, with style: TMBarBackgroundView.Style) -> TMSystemBar {
        let systemBar = bar.systemBar()
        systemBar.backgroundStyle = style
        return systemBar
    }
}

extension UIViewController {
    
    func add<Content: View>(_ controller: UIHostingController<Content>) {
        addChild(controller)
        controller.view.frame = view.frame
        view.addSubview(controller.view)
        didMove(toParent: controller)
    }
}
