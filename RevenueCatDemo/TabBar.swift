//
//  TabBar.swift
//  RevenueCatDemo
//
//  Created by Tim Mitra on 2024-01-08.
//

import SwiftUI

struct TabBar: View {
  var body: some View {
    TabView {
      ContentView()
        .tabItem {
          VStack {
            Image(systemName: "star.slash")
            Text("Free")
          }
        }
      ProView()
        .tabItem {
          VStack {
            Image(systemName: "star.fill")
            Text("Pro")
          }
        }

    }
  }
}

#Preview {
    TabBar()
}
