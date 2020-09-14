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
            Text("First Page")
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("First").font(Font.system(size: 24, weight: .bold)))
        }
    }
}

struct SecondView: View {
    
    var body: some View {
        NavigationView {
            Text("Second Page")
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("Second").font(Font.system(size: 24, weight: .bold)))
        }
    }
}
