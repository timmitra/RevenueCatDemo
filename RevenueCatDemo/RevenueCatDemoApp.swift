//
//  RevenueCatDemoApp.swift
//  RevenueCatDemo
//
//  Created by Tim Mitra on 2024-01-07.
//

import SwiftUI
import RevenueCat

@main
struct RevenueCatDemoApp: App {
  
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
