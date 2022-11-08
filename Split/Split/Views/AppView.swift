//
//  AppView.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import SwiftUI

struct AppView: View {
  var body: some View {
    TabView {
      ActivityView()
      .tabItem {
        Label("Activity", systemImage: "arrow.left.arrow.right")
      }

      NewBillView()
      .tabItem {
        Label("New Bill", systemImage: "rectangle.stack.badge.plus")
      }
    }
    .onAppear() {
      UITabBar.appearance().backgroundColor = UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255)
    }
    .accentColor(.white)
  }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
