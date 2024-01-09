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
  @State var showSubs = false
    var body: some View {
        VStack {
            Text("Everyone can see this!")
          SubscriptionStoreView(groupID: "21431347", visibleRelationships: .all) {
            StoreContent()
              .containerBackground(Color.cyan.gradient, for: .subscriptionStoreHeader)
          }
          .backgroundStyle(.clear)
          .subscriptionStorePickerItemBackground(.thinMaterial)
          .subscriptionStorePolicyDestination( for: .termsOfService) {
            Text("https://www.it-guy.com")
          }.subscriptionStorePolicyDestination( for: .privacyPolicy) {
            Text("https://www.it-guy.com")
          }
          .storeButton(.visible, for: .restorePurchases)
          .onInAppPurchaseCompletion { product, result in
              if case .success(.success(let transaction)) = result {
                  print("Purchased successfully: \(transaction.signedDate)")
                subscribed = true
              } else {
                  print("Something else happened")
                subscribed = false
              }
          }
          .manageSubscriptionsSheet(isPresented: $showSubs, subscriptionGroupID: "21431347")
          .subscriptionStatusTask(for: "21431347", action: { taskState in
            if let value = taskState.value {
              subscribed = !value
                .filter { $0.state != .revoked && $0.state != .expired }
                .isEmpty
            } else {
              subscribed = false
            }
          })
          .sheet(isPresented: $lifetimePage) {
            LifetimeStoreView()
              .presentationDetents([.height(250)])
              .presentationBackground(.ultraThinMaterial)
          }
          Button("More Purchase Options", action: {
            lifetimePage = true
          })
        }
        .onAppear {
          print("subscribed: \(subscribed)")
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
