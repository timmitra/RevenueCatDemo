//
//  RevenueCatDemoApp.swift
//  RevenueCatDemo
//
//  Created by Tim Mitra on 2024-01-07.
//

import SwiftUI
import RevenueCat

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    return true
  }
}

@main
struct RevenueCatDemoApp: App {
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
  init() {
    Purchases.configure(withAPIKey: "appl_LaYRANqhDmAdniTnaPZGfRIYABl")
    Purchases.logLevel = .verbose
  }
  
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension AppDelegate: PurchasesDelegate {
  func purchases(_ purchases: Purchases, receivedUpdated customerInfo: CustomerInfo) {
    // handle changes to customer info
  }
}
