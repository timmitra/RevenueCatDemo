//
//  ProView.swift
//  RevenueCatDemo
//
//  Created by Tim Mitra on 2024-01-07.
//

import SwiftUI
//import RevenueCat

struct ProView: View {
  @AppStorage("subscribed") private var subscribed: Bool = false
  @State private var isSubscribed = false
    var body: some View {
      VStack {
        Text("only subscribers can see this.")
          .blur(radius: subscribed ? 0 : 10)
      }
      .onAppear{
        print("subscribed: \(subscribed)")
        // check subscriber
        if subscribed == true {
          isSubscribed = subscribed
        //checkSubscriptionStatus()
      }
    }
  }
}

#Preview {
    ProView()
}
