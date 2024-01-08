//
//  ContentView.swift
//  RevenueCatDemo
//
//  Created by Tim Mitra on 2024-01-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Everyone can see this!")
          Button {
            // purchase Pro
          } label: {
            Text("Subscribe")
              .frame(width: 300, height: 50)
              .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
          }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
