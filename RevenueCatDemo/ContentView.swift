//
//  ContentView.swift
//  RevenueCatDemo
//
//  Created by Tim Mitra on 2024-01-07.
//

import SwiftUI
import RevenueCat

struct ContentView: View {
  @State private var showAlert = false
  @State private var alertTitle = ""
  @State private var alertDescription = ""
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
        .alert(isPresented: $showAlert) {
          Alert(title: Text(alertTitle), message: Text(alertDescription), dismissButton: .cancel())
        }
        .padding()
    }
  func subscribe() {
    Purchases.shared.getOfferings { offerings, error in
      if let packages = offerings?.current?.availablePackages {
        Purchases.shared.purchase(package: packages.first!) { transaction, purchaserInfo, error, userCancelled in
          
          if error != nil{
            // handle error
            alertTitle = "Purchase Failed!"
            alertDescription = "Error: \(error!.localizedDescription)"
            showAlert.toggle()
          }
          if purchaserInfo?.entitlements["pro"]?.isActive == true {
            // success
            print("✅ Purchase Successful!")
            alertTitle = "✅ Purchase Successful!"
            alertDescription = "You are now subscribed"
            showAlert.toggle()
          }
        }
      }
    }
  }
}

#Preview {
    ContentView()
}
