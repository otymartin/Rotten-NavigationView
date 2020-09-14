//
//  ContentView.swift
//  Rotten NavigationView
//
//  Created by Martin Otyeka on 2020-09-14.
//  Copyright © 2020 Rotten Apple. All rights reserved.
//

import SwiftUI

struct FirstView: View {
    
    var body: some View {
        NavigationView {
            Text("Notice the NavigationBar is not laid out properly. Tap the Second Tab then come back to the First. It will be fixed, Why?🤔")
                .padding([.leading, .trailing], 32)
                .multilineTextAlignment(.center)
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("First").font(Font.system(size: 24, weight: .bold)))
        }
    }
}

struct SecondView: View {
    
    var body: some View {
        NavigationView {
            Text("Notice that the NavigationBar on this view is properly laid out. Go back to the First View and it will be fixed.")
                .padding([.leading, .trailing], 32)
                .multilineTextAlignment(.center)
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("Second").font(Font.system(size: 24, weight: .bold)))
        }
    }
}
