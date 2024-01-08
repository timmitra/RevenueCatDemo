//
//  ContentView.swift
//  RevenueCatDemo
//
//  Created by Tim Mitra on 2024-01-07.
//

import SwiftUI
import StoreKit

struct ContentView: View {
  @AppStorage("subscribed") private var subscribed: Bool = false
  @State private var lifetimePage: Bool = false
  @State private var showAlert = false
  @State private var alertTitle = ""
  @State private var alertDescription = ""
    var body: some View {
        VStack {
            Text("Everyone can see this!")
          SubscriptionStoreView(groupID: "21431347", visibleRelationships: .all) {
            StoreContent()
              .containerBackground(Color.cyan.gradient, for: .subscriptionStoreHeader)
          }
          .backgroundStyle(.clear)
          .subscriptionStorePickerItemBackground(.thinMaterial)
          .storeButton(.visible, for: .restorePurchases)
          .sheet(isPresented: $lifetimePage) {
            LifetimeStoreView()
              .presentationDetents([.height(250)])
              .presentationBackground(.ultraThinMaterial)
          }
          Button("More Purchase Options", action: {
            lifetimePage = true
          })
        }
        .alert(isPresented: $showAlert) {
          Alert(title: Text(alertTitle), message: Text(alertDescription), dismissButton: .cancel())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
