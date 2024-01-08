//
//  ProView.swift
//  RevenueCatDemo
//
//  Created by Tim Mitra on 2024-01-07.
//

import SwiftUI

struct ProView: View {
    var body: some View {
      VStack {
        Text("only subscribers can see this.")
          .blur(radius: 10)
      }
      .onAppear{
        // check subscriber
      }
    }
}

#Preview {
    ProView()
}
