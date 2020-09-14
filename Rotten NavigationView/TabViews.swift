//
//  ContentView.swift
//  Rotten NavigationView
//
//  Created by Martin Otyeka on 2020-09-14.
//  Copyright © 2020 Rotten Apple. All rights reserved.
//

import SwiftUI

struct TabView: View {
    let page: String
    let text: String
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.edgesIgnoringSafeArea(.all)
                Text(text)
            }.navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: Text(page).font(Font.system(size: 24, weight: .bold)))
        }
    }
}
//
//struct SecondView: View {
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.blue.edgesIgnoringSafeArea(.all)
//                Text("Swipe to Previous")
//            }.navigationBarTitle("", displayMode: .inline)
//            .navigationBarItems(leading: Text("Second").font(Font.system(size: 24, weight: .bold)))
//        }
//    }
//}
