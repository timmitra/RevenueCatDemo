//
//  ProView.swift
//  RevenueCatDemo
//
//  Created by Tim Mitra on 2024-01-07.
//

import SwiftUI
import RevenueCat

struct ProView: View {
  @State private var isSubscribed = false
    var body: some View {
      VStack {
        Text("only subscribers can see this.")
          .blur(radius: isSubscribed ? 0 : 10)
      }
      .onAppear{
        // check subscriber
        checkSubscriptionStatus()
      }
    }
  func checkSubscriptionStatus() {
    Purchases.shared.getCustomerInfo { customerInfo, error in
      if let info = customerInfo {
        if info.entitlements["pro"]?.isActive == true {
          print("Subscription Active")
          isSubscribed = true
        }
      }
    }
  }
}

#Preview {
    ProView()
}
