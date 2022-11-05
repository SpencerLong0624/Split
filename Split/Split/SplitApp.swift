//
//  SplitApp.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct SplitApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  var body: some Scene {
      WindowGroup {
          AppView()
      }
  }
}
